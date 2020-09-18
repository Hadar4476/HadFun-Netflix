<?php
// if user clicked on log in or register:

// sets the background for working with sessions:
session_start();

if (isset($_SESSION['user_id'])) {
    header('location: blog.php');
    exit;
}

require_once '../app/helpers.php';
include_once 'users_icons.php';


$errors = [
    'signin_email' => '',
    'signin_password' => '',
    'signup_username' => '',
    'signup_email' => '',
    'signup_password' => '',
    'gender_error' => '',
    'submit' => '',
];

$link = mysqli_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB);

if (isset($_POST['submit']) && isset($_POST['signin_email']) || isset($_POST['signin_password'])) {
    $signin_email = filter_input(INPUT_POST, 'signin_email', FILTER_VALIDATE_EMAIL);
    $signin_email = trim($signin_email);
    $signin_password = filter_input(INPUT_POST, 'signin_password', FILTER_SANITIZE_STRING);
    $signin_password = trim($signin_password);
    $signin_form_valid = true;
    if (!$signin_email) {
        $signin_form_valid = false;
        $errors['signin_email'] = ' * Invalid email * ';
    }
    if (!$signin_password) {
        $signin_form_valid = false;
        $errors['signin_password'] = ' * Invalid password * ';
    }
    if ($signin_form_valid) {
        // protecting from sql injection:
        $signin_email = mysqli_real_escape_string($link, $signin_email);
        $signin_password = mysqli_real_escape_string($link, $signin_password);
        $sql = "SELECT * FROM users WHERE email = '$signin_email' LIMIT 1";
        $result = mysqli_query($link, $sql);
        if ($result && mysqli_num_rows($result) == 1) {
            $user = mysqli_fetch_assoc($result);
            if (password_verify($signin_password, $user['password'])) {
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_username'] = $user['username'];
                $_SESSION['user_avatar'] = $user['avatar'];
                header('location: blog.php');
                exit;
            } else $errors['signin_password'] = ' * Wrong email or password * ';
        } else $errors['signin_password'] = ' * Wrong email or password * ';
    }
    $token = csrf_token();
} else {
    $token = csrf_token();
}

if (isset($_POST['submit']) && isset($_POST['signup_username']) || isset($_POST['signup_email']) || isset($_POST['signup_password'])) {
    $signup_username = filter_input(INPUT_POST, 'signup_username', FILTER_SANITIZE_STRING);
    $signup_username = trim($signup_username);
    $signup_username = mysqli_real_escape_string($link, $signup_username);

    $signup_email = filter_input(INPUT_POST, 'signup_email', FILTER_VALIDATE_EMAIL);
    $signup_email = trim($signup_email);
    $signup_email = mysqli_real_escape_string($link, $signup_email);

    $signup_password = filter_input(INPUT_POST, 'signup_password', FILTER_SANITIZE_STRING);
    $signup_password = trim($signup_password);
    $signup_password = mysqli_real_escape_string($link, $signup_password);

    $gender = filter_input(INPUT_POST, 'gender', FILTER_SANITIZE_STRING);
    $gender = trim($gender);
    $gender = mysqli_real_escape_string($link, $gender);

    $signup_form_valid = true;

    if (!$signup_username || strlen($signup_username) < 3) {
        $signup_form_valid = false;
        $errors['signup_username'] = ' * Invalid username * ';
    } else if (check_exists($link, $signup_username, 'username')) {
        $signup_form_valid = false;
        $errors['signup_username'] = ' * Username is already in use * ';
    }
    if (!$signup_email) {
        $signup_form_valid = false;
        $errors['signup_email'] = ' * Invalid email * ';
    } else if (check_exists($link, $signup_email, 'email')) {
        $signup_form_valid = false;
        $errors['signup_email'] = ' * Email is already taken * ';
    }
    if (!$signup_password || strlen($signup_password) < 6 || strlen($signup_password) > 20) {
        $signup_form_valid = false;
        $errors['signup_password'] = ' * Invalid password * ';
    }
    if (!$gender) {
        $signup_form_valid = false;
        $errors['gender_error'] = ' * Please, mark your gender * ';
    } else if ($gender !== "male" && $gender !== "female") {
        $signup_form_valid = false;
        $errors['gender_error'] = ' * Haha, nice try * ';
    }
    if ($signup_form_valid) {

        $avatar = '';
        $male_icons_length =  count($male_icons) - 1;
        $female_icons_length =  count($female_icons) - 1;
        $random_male = $male_icons[rand(0, $male_icons_length)];
        $random_female =  $female_icons[rand(0, $female_icons_length)];
        if ($gender == 'male') $avatar = $random_male;
        if ($gender == 'female') $avatar = $random_female;

        $signup_password = password_hash($signup_password, PASSWORD_BCRYPT);

        $insert_user = "INSERT INTO users VALUES(null,'$signup_username','$signup_email','$signup_password','$gender','$avatar')";
        $insert_result = mysqli_query($link, $insert_user);
        if ($insert_result && mysqli_affected_rows($link)) {
            $_SESSION['user_id'] = mysqli_insert_id($link);
            $_SESSION['user_username'] = $signup_username;
            $_SESSION['user_avatar'] = $avatar;
            header('location: blog.php');
            exit;
        }
    }
}
?>

<?php include 'header.php' ?>
<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
<main>
    <div class="container text-center mt-4">
        <div class="row">
            <div class="col">
                <h2 class="title text-white">Join HadFun family today!</h2>
                <p class="about text-white">Share your opinions and thoughts about Netflix shows and movies with others
                </p>
            </div>
        </div>
    </div>
    <div class="form_container" id="form_container">
        <div class="form-container sign-up-container">
            <form actuin="" method='POST' autocomplete="off" novalidate="novalidate">
                <h1 class="form-title mb-auto fs-4">Create an account:</h1>
                <label class="d-none" for="signup_username"></label>
                <input value="<?= old_user_data('signup_username'); ?>" class="formInput rounded" id='signup_username' name='signup_username' type="text" placeholder="Username" readonly onfocus="this.removeAttribute('readonly');" />
                <span class="error"><b id="signup_username_error"><?= $errors['signup_username']; ?></b></span>
                <label class="d-none" for="signup_email"></label>
                <input value="<?= old_user_data('signup_email'); ?>" class="formInput rounded" id='signup_email' name='signup_email' type="email" placeholder="Email" readonly onfocus="this.removeAttribute('readonly');" />
                <span class="error"><b id="signup_email_error"><?= $errors['signup_email']; ?></b></span>
                <label class="d-none" for="signup_password"></label>
                <input class="formInput rounded" id='signup_password' name='signup_password' type="password" placeholder="Password" readonly onfocus="this.removeAttribute('readonly');" />
                <span class="error"><b id="signup_password_error"><?= $errors['signup_password']; ?></b></span>
                <div class="d-flex w-100 pl-1">
                    <p class="mr-auto"><b>I'm a :</b></p>
                    <div class="form-check p-1">
                        <input id="male_radio" onclick="save_gender(event)" class="form-check-input mr-9000" type="radio" value="male" name="gender">
                        <label class="form-check-label mr-9000" for="gender">Male</label>
                        <input id="female_radio" onclick="save_gender(event)" class="form-check-input" type="radio" value="female" name="gender">
                        <label class="form-check-label" for="gender">Female</label>
                    </div>
                </div>
                <span class="error"><b id="gender_error"><?= $errors['gender_error']; ?></b></span>
                <button id='submitBtn' type="submit" name="submit" class="formBtn mb-4">Register</button>
            </form>
        </div>
        <div class="form-container sign-in-container text-center">
            <h1 class="form-title mb-auto fs-5">Welcome back!</h1>
            <form action="" method='POST' autocomplete="off" novalidate="novalidate">
                <input type="hidden" name="token" value="<?= $token ?>">
                <label class="d-none" for="signin_email"></label>
                <input value="<?= old_user_data('signin_email'); ?>" class="formInput rounded" id='signin_email' name='signin_email' type="email" placeholder="Email" readonly onfocus="this.removeAttribute('readonly');" />
                <span class="error"><b><?= $errors['signin_email']; ?></b></span>
                <label class="d-none" for="signin_password"></label>
                <input class="formInput rounded" id='signin_password' name='signin_password' type="password" placeholder="Password" readonly onfocus="this.removeAttribute('readonly');" />
                <span class="error"><b><?= $errors['signin_password']; ?></b></span>
                <button type="submit" name="submit" class="formBtn">Log In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h3 class="overlay-title">Already have an account?</h3>
                    <button class="formBtn ghost" id="signIn">Log In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h3 class="overlay-title">Don't have an account?</h3>
                    <button class="formBtn ghost" id="signUp">Register</button>
                </div>
            </div>
        </div>
    </div>
</main>
<?php include 'footer.php' ?>