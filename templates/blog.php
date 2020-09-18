<?php
session_start();
if (!$_SESSION['user_id']) {
    header('location: index.php');
    exit;
}

require_once '../app/helpers.php';

$data = [];

// shows_and_movies
$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
$sql = "SELECT * FROM shows_and_movies";
$result = mysqli_query($link, $sql);

if ($result && mysqli_num_rows($result) > 0) {
    $shows_and_movies = $result->fetch_all(MYSQLI_ASSOC);
    $data = $shows_and_movies;
}

$data_length = count($data);

?>
<?php include 'header.php'; ?>
<main>
    <div class="galleryContainer container text-center">
        <div class="row">
            <?php for ($i = 0; $i < $data_length; $i++) : ?>
                <div class="col pt-3">
                    <div class="bg-danger netflixShow" style='background-image: url("<?= $data[$i]['image']; ?>");
                     background-repeat: no-repeat; 
                     width:341px; 
                     height:192px'>
                        <div class="anchorsContainer animate__animated animate__fadeIn">
                            <a title='Share your opinion' class="posfa myPost" href="user_post.php?show=<?= $data[$i]['id'] ?>"><i class="far fa-keyboard fa-2x"></i></a>
                            <a title="See others opinions" class="posfa othersPosts" href="show_page.php?show=<?= $data[$i]['id'] ?>"><i class="fas fa-users fa-2x ml-1"></i></a>
                        </div>
                    </div>
                </div>
            <?php endfor; ?>
        </div>
    </div>
</main>
<?php include 'footer.php'; ?>