<?php
session_start();
if (!$_SESSION['user_id']) {
    header('location: index.php');
    exit;
}
$show = $_GET['show'];
if (empty($show) || !is_numeric($show) || strlen($show) > 2 || $show > 51) {
    header('location: blog.php');
    exit;
}

require_once 'app/helpers.php';

$errors = [
    'user_post' => ''
];

$netflix_show  = [];

$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
$sql = "SELECT * FROM shows_and_movies WHERE id = $show";
$result = mysqli_query($link, $sql);
if ($result && mysqli_num_rows($result) > 0) {
    $netflix_show = mysqli_fetch_assoc($result);
}

$show_id =  $netflix_show['id'];
$user_id =  $_SESSION['user_id'];

if (isset($_POST['submit'])) {
    $user_post = filter_input(INPUT_POST, 'user_post', FILTER_SANITIZE_STRING, FILTER_FLAG_NO_ENCODE_QUOTES);
    $user_post = trim($user_post);
    $form_valid = true;
    if (!$user_post || mb_strlen($user_post) < 2) {
        $errors['user_post'] = ' * Your post is too short * ';
        $form_valid = false;
    }
    if ($form_valid) {
        //                               id	  user_id  show_movie_id	post	date
        $user_post = mysqli_real_escape_string($link, $user_post);
        $insert_sql = "INSERT INTO posts VALUES(null,$user_id,$show_id,'$user_post',NOW())";
        $posts_result = mysqli_query($link, $insert_sql);
        // check if INSERT INTO succeed:
        mysqli_affected_rows($link);
        mysqli_num_rows($posts_result);
        if ($posts_result && mysqli_affected_rows($link)) {
            header("location: show_page.php?show=$show_id");
            exit;
        }
    }
}

?>

<?php include 'templates/header.php'; ?>
<main>
    <div class="container text-center mt-1">
        <div class="row">
            <div class="col">
                <h1 class="moderator text-white">Share What You Think About</h1>
                <img class="showLogo" src="<?= $netflix_show['logo'] ?>" alt="<?= $netflix_show['title'] ?>">
                <div id='postForm'></div>
                <form class="userPostForm w-50 h-75 rounded text-left" action="#" method="POST" novalidate="novalidate">
                    <div class="form-group w-100 mt-4">
                        <h1 class="postLabel">Show/Movie :</h1>
                        <h2 class="form-control"><?= $netflix_show['title'] ?></h2>
                    </div>
                    <div class="form-group w-100">
                        <label class="postLabel" for="user_post">Share your thoughts :</label>
                        <textarea class="form-control" name="user_post" id="user_post" cols="30" rows="10"><?= old_user_data('user_post') ?></textarea>
                        <span class="error"><b id='user_post_error'><?= $errors['user_post']; ?></b></span>
                    </div>
                    <div class="w-100 d-flex justify-content-between">
                        <a href="/hadfun&netflix-project/blog.php" class="cancelBtn btn w-50 text-white mr-1">Cancel</a>
                        <button type="submit" name="submit" class="postBtn w-50 btn text-white ml-1">Post</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<?php include 'templates/footer.php'; ?>