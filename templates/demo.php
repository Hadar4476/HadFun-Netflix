<?php

$password = '123456';
$hash = password_hash($password, PASSWORD_BCRYPT);
echo $hash . '<br>';
$password_verify = password_verify($password, $hash);
echo $password_verify;
