<footer>
    <div class="container mt-4">
        <div class="row">
            <div class="col d-flex p-4 justify-content-center">
                <img onclick="document.location='#page_header'" id="footer_logo" onmouseover="highlightFooter()" onmouseout="muteFooter()" src="data:image/png;base64,<?php echo base64_encode(file_get_contents("../images/footer-logo.png")); ?>" alt="footer-logo" class="footerLogo img-fluid">
                <img onclick="document.location='#page_header'" id="netflix_logo" src="data:image/png;base64,<?php echo base64_encode(file_get_contents("../images/netflix-logo.png")); ?>" onmouseover="highlightFooter()" onmouseout="muteFooter()" alt="netflix-logo" class="footerLogo img-fluid ml-4" />
            </div>
        </div>
    </div>
</footer>
<script>
    <?php
    include '../js/index.js';
    include '../js/form.js';
    include '../js/show_page.js';
    ?>
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous">
</script>
<script src="https://kit.fontawesome.com/7385d43a6a.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.1.0/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>

</html>