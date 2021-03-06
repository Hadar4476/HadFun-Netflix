<?php
date_default_timezone_set('Asia/Jerusalem');

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
include_once 'users_icons.php';

$netflix_show  = [];
$show_movie_posts = [];

$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
$sql = "SELECT * FROM shows_and_movies WHERE id = $show";
$result = mysqli_query($link, $sql);
if ($result && mysqli_num_rows($result) > 0) {
    $netflix_show = mysqli_fetch_assoc($result);
}

$user_id = $_SESSION['user_id'];
$show_id = $netflix_show['id'];

$get_posts = "SELECT * FROM posts WHERE show_movie_id = $show_id ORDER BY date DESC";
$data = mysqli_query($link, $get_posts);

function get_user_field($uid, &$link, $field)
{
    $get_user = "SELECT * FROM users WHERE id = $uid";
    $res = mysqli_query($link, $get_user);
    if ($res && mysqli_num_rows($res) > 0) {
        $user = mysqli_fetch_assoc($res);
        return htmlspecialchars($user[$field]);
    }
}

function post_date($date)
{
    $then = new DateTime($date);
    $now = new DateTime(date('Y-m-d H:i:s', time()));
    $diff = $then->diff($now);
    $time = array('years' => $diff->y, 'months' => $diff->m, 'days' => $diff->d, 'hours' => $diff->h, 'minutes' => $diff->i, 'seconds' => $diff->s);
    if ($time['years'] && $time['years'] == 1) return ' a year ago';
    if ($time['years'] && $time['years'] > 1) return $time['years'] . ' years ago';
    if ($time['months'] && $time['months'] == 1) return $time['months'] . ' month ago';
    if ($time['months'] && $time['months'] > 1) return $time['months'] . ' months ago';
    if ($time['days'] && $time['days'] == 1) return 'Yesterday';
    if ($time['days'] && $time['days'] > 1 && $time['days'] < 7) return $time['days'] . ' days ago';
    if ($time['days'] && $time['days'] >= 7 && $time['days'] < 14) return '1 week ago';
    if ($time['days'] && $time['days'] >= 14 && $time['days'] < 21) return '2 week ago';
    if ($time['days'] && $time['days'] >= 21 && $time['days'] < 28) return '3 week ago';
    if ($time['hours'] && $time['hours'] == 1) return ' an hour ago';
    if ($time['hours'] && $time['hours'] > 1) return $time['hours'] . ' hours ago';
    if ($time['minutes'] && $time['minutes'] == 1) return 'A minute ago';
    if ($time['minutes'] && $time['minutes'] > 1) return $time['minutes'] . ' minutes ago';
    if ($time['seconds'] >= 0) return 'a few seconds ago';
}
?>

<?php include 'templates/header.php'; ?>
<main>
    <div class="container text-center mt-1">
        <div class="row">
            <div class="col">
                <img src="<?= $netflix_show['logo'] ?>" alt="<?= $netflix_show['title'] ?>">
                <br>
                <a class="userPostAnchor btn text-white mt-4" href="/hadfun&netflix-project/user_post.php?show=<?= $netflix_show['id'] ?>"><i class="fas fa-plus pr-3"></i>Share your opinion</a>
                <?php if ($data && mysqli_num_rows($data) > 0) : ?>
                    <?php while ($post = mysqli_fetch_assoc($data)) : ?>
                        <div class="d-flex">
                            <img class="userIcon bg-white p-2" src="<?= get_user_field($post['user_id'], $link, 'avatar') ?>" alt="<?= get_user_field($post['user_id'], $link, 'username') ?>">
                            <div class="postContainer bg-white w-50 rounded text-left">
                                <div class="d-flex">
                                    <h2 class="username w-50"><b><?= get_user_field($post['user_id'], $link, 'username') ?></b></h2>
                                    <?php if ($user_id == $post['user_id']) : ?>
                                        <div class="ml-auto">
                                            <p id="post_id" class="d-none"><?= $post['id'] ?></p>
                                            <a id="save_edit_anchor" class="d-none" onclick="save_edit(event)">
                                                <i class="far fa-check-square fa-lg"></i>
                                            </a>
                                            <a id="edit_anchor" class="text-dark" onclick="start_edit(event)">
                                                <i class="far fa-edit fa-lg"></i>
                                            </a>
                                            <a id="delete_anchor" class="text-dark" onclick="get_post_id(event)">
                                                <i class="fas fa-times fa-lg"></i>
                                            </a>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <p id="post_content" class="userPost border border-dark rounded p-2 m-1"><?= str_replace("\n", "<br>", htmlspecialchars($post['post'])) ?></p>
                                <?php if ($user_id == $post['user_id']) : ?>
                                    <textarea id="user_edit_post" class="d-none" name="user_edit_post" rows="10" placeholder="Type your content here..."><?= str_replace("\n", '<br>', htmlspecialchars($post['post'])) ?></textarea>
                                <?php endif; ?>
                                <div class="d-flex justify-content-end">
                                    <p class="pr-1"><?= post_date($post['date']) ?></p>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</main>
<?php include 'templates/footer.php'; ?>