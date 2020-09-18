window.onload = () => {
  rememberSignUp();
  rememberGender();
};

const signUpButton = document.getElementById("signUp");
const signInButton = document.getElementById("signIn");
const form_container = document.getElementById("form_container");

let signup_username = document.getElementById("signup_username");
let signup_email = document.getElementById("signup_email");
let signup_password = document.getElementById("signup_password");

let signup_username_error;
let signup_email_error;
let signup_password_error;

if (document.getElementById("signup_username_error")) {
  signup_username_error = document.getElementById("signup_username_error")
    .innerHTML;
}

if (document.getElementById("signup_email_error")) {
  signup_email_error = document.getElementById("signup_email_error").innerHTML;
}

if (document.getElementById("signup_password_error")) {
  signup_password_error = document.getElementById("signup_password_error")
    .innerHTML;
}

if (signUpButton) {
  signUpButton.addEventListener("click", () => {
    form_container.classList.add("right-panel-active");
  });
}

if (signInButton) {
  signInButton.addEventListener("click", () => {
    if (signup_username_error) signup_username_error = "";
    if (signup_email_error) signup_email_error = "";
    if (signup_password_error) signup_password_error = "";
    form_container.classList.remove("right-panel-active");
    localStorage.setItem("gender", "");
  });
}

rememberSignUp = () => {
  if (
    (signup_username_error && signup_username_error.length > 0) ||
    (signup_email_error && signup_email_error.length > 0) ||
    (signup_password_error && signup_password_error.length > 0)
  )
    form_container.classList.add("right-panel-active");
};

save_gender = (e) => {
  if (e.target.value === "male") {
    localStorage.setItem("gender", "male");
  }
  if (e.target.value === "female") {
    localStorage.setItem("gender", "female");
  }
};

rememberGender = () => {
  let gender = localStorage.getItem("gender");
  if (gender === "male") {
    if (document.getElementById("male_radio")) {
      let male_radio = document.getElementById("male_radio");
      if (male_radio) male_radio.click();
    }
  }
  if (gender === "female") {
    if (document.getElementById("female_radio")) {
      let female_radio = document.getElementById("female_radio");
      if (female_radio) female_radio.click();
    }
  }
};

// user_post.php:

const user_post_error = document.getElementById("user_post_error");
if (user_post_error && user_post_error.innerHTML) window.location = "#postForm";
