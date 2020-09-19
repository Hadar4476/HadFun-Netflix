<?php

session_start();
require_once 'app/helpers.php';

$user_id = $_SESSION['user_id'];
if (!$user_id) {
    header('location: index.php');
    exit;
}
$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

$post_id = !empty($_GET['post']) ? trim($_GET['post']) : null;
$post_id = mysqli_real_escape_string($link, $post_id);

if ($post_id && is_numeric($post_id)) {

    $get_show = "SELECT show_movie_id FROM posts WHERE id = $post_id";
    $show = mysqli_query($link, $get_show);
    if ($show && mysqli_affected_rows($link) > 0) $show_id = mysqli_fetch_assoc($show)['show_movie_id'];

    $sql = "DELETE FROM posts WHERE id = $post_id AND user_id = $user_id";
    $result = mysqli_query($link, $sql);

    if ($result && mysqli_affected_rows($link) > 0)  header("location: show_page.php?show=$show_id");
}
