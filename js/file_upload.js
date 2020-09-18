$("#file_input").on("change", function (e) {
  var filename = e.target.files[0].name;
  console.log(filename);
  $("#file_name").text(filename);
});
