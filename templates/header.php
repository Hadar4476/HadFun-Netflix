<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- font-family: 'GraphiqueProNextCo'; --->
    <link href="//db.onlinewebfonts.com/c/69baa409a08898b1529830a984c0f25c?family=GraphiqueProNextCo" rel="stylesheet" type="text/css" />
    <!-- font-family: "GraphiqueW01-Regular"; --->
    <link href="//db.onlinewebfonts.com/c/ab83b275830b2d585ea027c47e3b237a?family=GraphiqueW01-Regular" rel="stylesheet" type="text/css" />
    <!-- font-family: 'Bebas Neue', cursive; --->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <style>
        <?php include 'css/index.css';
        include 'css/header.css';
        include 'css/main.css';
        include 'css/form.css';
        include 'css/blog.css';
        include 'css/user_post.css';
        include 'css/user_profile.css';
        include 'css/show_page.css';
        include 'css/footer.css';
        ?>
    </style>
    <title>Hadfun & Netflix</title>
</head>

<body>
    <header id="page_header">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a href="http://hadfunandnetflix.com/blog.php">
                <img src="data:image/png;base64,<?php echo base64_encode(file_get_contents("images/logo.png")); ?>" alt="logo" class="logo img-fluid">
            </a>
            <?php if (isset($_SESSION['user_id'])) : ?>
                <div class="ml-auto d-flex">
                    <img class="userAvatar" src="<?= $_SESSION['user_avatar'] ?>" alt="<?= $_SESSION['user_username'] ?>">
                    <div class="dropdown pt-2">
                        <button class="btn dropdown-toggle text-white mt-1" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello, <?= htmlspecialchars($_SESSION['user_username']); ?>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="user_profile.php">My Profile</a>
                            <a class="dropdown-item" href="logout.php">Logout</a>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </nav>
    </header>