guida_btn = document.getElementById("guide-btn");
par = document.getElementById("cheeky-question");

function SonoGuida() {
  event.preventDefault();
  const elems = document.querySelectorAll(".hidden");
  console.log(elems.length);
  elems.forEach((elem) => {
    elem.classList.remove("hidden");
  });

  ur = document.getElementById("user_role_id");
  ur.value = 10;

  guida_btn.classList.add("hidden");
  par.classList.add("hidden");
}
