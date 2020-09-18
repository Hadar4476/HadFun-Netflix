let footer_logo = document.getElementById("footer_logo");
let netflix_logo = document.getElementById("netflix_logo");

highlightFooter = () => {
  footer_logo.style.opacity = "100%";
  netflix_logo.style.opacity = "100%";
};

muteFooter = () => {
  footer_logo.style.opacity = "70%";
  netflix_logo.style.opacity = "70%";
};
