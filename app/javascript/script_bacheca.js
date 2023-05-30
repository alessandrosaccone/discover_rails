function button() {
    document.getElementById("form").style.display = "block";
    document.getElementById("view_area").style.display = "none";
  }
  
  function button_2() {
    document.getElementById("view_area").style.display = "block";
    document.getElementById("form").style.display = "none";
    document.getElementById("msg").style.display = "none";
    $("#view").on("click", function () {
      $("#view_area").load("bacheca_schede.php");
    });
  }