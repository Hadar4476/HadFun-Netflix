<?php
session_start();
if (!$_SESSION['user_id']) {
    header('location: index.php');
    exit;
}

require_once 'app/helpers.php';

// shows_and_movies
$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);
$sql = "SELECT * FROM shows_and_movies";
$result = mysqli_query($link, $sql);

?>
<?php include 'templates/header.php'; ?>
<main>
    <div class="galleryContainer container text-center">
        <div class="row">
            <?php if($result && mysqli_num_rows($result) > 0): ?>
            <?php while($data = mysqli_fetch_assoc($result)): ?>
                     <div class="col pt-3">
                    <div class="bg-danger netflixShow" style='background-image: url("<?= $data['image']; ?>");
                     background-repeat: no-repeat; 
                     width:341px; 
                     height:192px'>
                        <div class="anchorsContainer animate__animated animate__fadeIn">
                            <a title='Share your opinion' class="posfa myPost" href="user_post.php?show=<?= $data['id'] ?>"><i class="far fa-keyboard fa-2x"></i></a>
                            <a title="See others opinions" class="posfa othersPosts" href="show_page.php?show=<?= $data['id'] ?>"><i class="fas fa-users fa-2x ml-1"></i></a>
                        </div>
                    </div>
                </div>
            <?php endwhile;?>
            <?php endif; ?>
        </div>
    </div>
</main>
<?php include 'templates/footer.php'; ?>