<?php

require_once 'db.config.php';

if (!function_exists('old_user_data')) {

    /** 
     * Restore last value
     *
     *
     * @param string $fieldname The input's name
     * @return string 
     */
    function old_user_data($fieldname)
    {
        return $_REQUEST[$fieldname] ?? '';
    }
}

if (!function_exists('csrf_token')) {
    function csrf_token()
    {
        $token = sha1('$$hadfun' . rand(1, 1000) . '--!#php');
        $_SESSION['token'] = $token;
        return $token;
    }
}

if (!function_exists('check_exists')) {
    function check_exists($link, $input, $field)
    {
        $sql = "SELECT $field FROM users WHERE $field = '$input'";
        $result = mysqli_query($link, $sql);
        if ($result && mysqli_num_rows($result) > 0) return true;
        else return false;
    }
}
