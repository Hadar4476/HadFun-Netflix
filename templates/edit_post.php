<?php

session_start();
require_once '../app/helpers.php';
$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

$user_id = $_SESSION['user_id'];
if (!$user_id) {
    header('location: index.php');
    exit;
}

$post_id = !empty($_GET['post_id']) ? trim($_GET['post_id']) : null;
$post_id = mysqli_real_escape_string($link, $post_id);

$post_content = $_GET['post_content'];

if ($post_id && is_numeric($post_id)) {

    $get_show = "SELECT show_movie_id FROM posts WHERE id = $post_id";
    $show = mysqli_query($link, $get_show);
    if ($show && mysqli_affected_rows($link) > 0) $show_id = $show->fetch_all(MYSQLI_ASSOC)[0]['show_movie_id'];

    $sql = "UPDATE posts SET post = '$post_content' WHERE id = $post_id AND user_id = $user_id";
    $result = mysqli_query($link, $sql);
    header("location: show_page.php?show=$show_id");
}
