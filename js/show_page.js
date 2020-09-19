start_edit = () => {
  let edit_anchor = document.getElementById("edit_anchor");
  let save_edit_anchor = document.getElementById("save_edit_anchor");
  let user_edit_post = document.getElementById("user_edit_post");

  user_edit_post.className = "form-control";
  edit_anchor.className = "d-none";
  save_edit_anchor.className = "";
};

function save_edit() {
  let post_id = document.getElementById("post_id");
  let edit_anchor = document.getElementById("edit_anchor");
  let save_edit_anchor = document.getElementById("save_edit_anchor");
  let user_edit_post = document.getElementById("user_edit_post");
  console.log(user_edit_post.value);
  Swal.fire({
    title: "Save changes?",
    icon: "info",
    showCancelButton: true,
    confirmButtonColor: "#e50914",
    cancelButtonColor: "#000",
    confirmButtonText: "Yes",
  }).then((result) => {
    if (result.isConfirmed) {
      if (!user_edit_post.value) {
        Swal.fire({
          title: "Please fill some content",
          showCancelButton: false,
          confirmButtonColor: "#000",
          confirmButtonText: "OK",
        });
        return;
      }
      window.location = `http://hadfunandnetflix.com/edit_post.php?post_id=${post_id.innerHTML}&post_content=${user_edit_post.value}`;
    } else {
      user_edit_post.className = "d-none";
      edit_anchor.className = "text-dark";
      save_edit_anchor.className = "d-none";
    }
  });
}

get_post_id = () => {
  let post_id = document.getElementById("post_id");
  let delete_anchor = document.getElementById("delete_anchor");
  if (post_id && delete_anchor) startSwal(post_id.innerHTML);
};

function startSwal(post_id) {
  Swal.fire({
    title: "Are you sure you want to delete this post?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#000",
    cancelButtonColor: "#e50914",
    confirmButtonText: "Delete",
  }).then((result) => {
    if (result.isConfirmed) {
      window.location = `http://hadfunandnetflix.com/delete_post.php?post=${post_id}`;
    }
  });
}
