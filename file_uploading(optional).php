<?php

echo '<pre>';
print_r($_FILES);
echo '</pre>';

function generateRandomString($length = 30)
{

    $characters = '0123456789';
    $characters .= 'abcdefghijklmnopqrstuvwxyz';
    $characters .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    $max = strlen($characters) - 1;
    $randomString = '';

    for ($x = 0; $x < $length; $x++) {

        $randomString .= $characters[rand(0, $max)];
    }

    return $randomString;
}

if (isset($_FILES['image']['error']) && $_FILES['image']['error'] == 0 && is_uploaded_file($_FILES['image']['tmp_name'])) {

    $max_image_size = 1024 * 1024 * 5;
    $extensions = ['png', 'jpeg', 'jpg', 'gif', 'bmp',];
    $types = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif', 'image/bmp',];

    if ($_FILES['image']['size'] <= $max_image_size) {

        $file_details = pathinfo($_FILES['image']['name']);

        if (in_array(strtolower($file_details['extension']), $extensions)) {

            if (in_array($_FILES['image']['type'], $types)) {

                $pofile_image = generateRandomString(5) . '-' . date('Y.m.d.H.is') . '-' . $_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'], '../images/' . $pofile_image);
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        .w-10 {
            width: 10% !important;
        }

        .w-15 {
            width: 15% !important;
        }

        .custom-file-label::after {
            content: none !important;
        }
    </style>
</head>

<body>
    <div class="container mt-4 w-25">
        <div class="row">
            <div class="col text-center">
                <form method="POST" novalidate="novalidate" autocomplete="off" action="" enctype="multipart/form-data">
                    <div class="input-group text-left">
                        <p id="file_name" class="form-control">File name...</p>
                        <div class="custom-file text-center">
                            <input id="file_input" type="file" class="custom-file-input w-100" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="image">
                            <label class="custom-file-label w-50" for="inputGroupFile04">Upload</label>
                        </div>
                    </div>
                    <div class="input-group mt-4 w-75 ml-1 justify-content-end">
                        <label class="d-none" for="submit"></label>
                        <input type="submit" name="submit" id="submit" class="btn btn-primary" value="Submit">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        <?php
        include '../js/file_upload.js';
        ?>
    </script>
</body>

</html>