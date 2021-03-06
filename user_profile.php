<?php

session_start();
if (!isset($_SESSION['user_id'])) {
    header('location: index.php');
    exit;
}

require_once 'app/helpers.php';


$uid = $_SESSION['user_id'];
$show_movie = '';

$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
$sql = "SELECT * FROM posts WHERE user_id = $uid ORDER BY date DESC";
$result = mysqli_query($link, $sql);

function get_show_movie_name($id, &$link)
{
    $get_name_sql = "SELECT title FROM shows_and_movies WHERE id = $id";
    $data = mysqli_query($link, $get_name_sql);
    if ($data && mysqli_num_rows($data) > 0) {
        $name = mysqli_fetch_assoc($data);
        return ($name['title']);
    }
}

?>

<?php include 'templates/header.php'; ?>

<main>
    <?php if ($result && mysqli_num_rows($result) > 0) : ?>
        <div class="container m-auto w-50">
            <div class="row">
                <div class="col">
                    <h1 class="myPosts text-white">My Posts:</h1>
                    <?php while ($user_post = mysqli_fetch_assoc($result)) : ?>
                        <div class="bg-white w-75 rounded mt-4 p-2">
                            <h2 class="form-control w-50"><b><?= get_show_movie_name($user_post['show_movie_id'], $link) ?></b></h2>
                            <p class="form-control"><?= htmlspecialchars($user_post['post']) ?></p>
                            <div class="d-flex justify-content-end">
                                <p class="pr-1"><?= $user_post['date'] ?></p>
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    <?php else : ?>
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <h1 class="myPosts text-white">Seems like your post list is empty</h1>
                    <a href="/hadfun&netflix-project/blog.php" class="browseBtn btn text-white">Browse Netflix Shows & Movies</a>
                </div>
            </div>
        </div>
    <?php endif; ?>

</main>

<?php include 'templates/footer.php'; ?>