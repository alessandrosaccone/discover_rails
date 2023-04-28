function reveal() {
  var reveals = document.querySelectorAll(".reveal");
  var nav = document.getElementById("navbar");
  for (var i = 0; i < reveals.length; i++) {
    var windowHeight = window.innerHeight;
    var elementTop = reveals[i].getBoundingClientRect().top;
    var elementVisible = 30;
    if (elementTop < windowHeight - elementVisible) {
      reveals[i].classList.add("active");
    } else {
      reveals[i].classList.remove("active");
    }
    if (elementTop < windowHeight + 600) {
      nav.style.background = "#dd7d40bd";
    } else {
      nav.style.background = "transparent";
    }
  }
}

function bar_color() {
  var myNav = document.getElementById("navbar_app");
  if(!myNav){
    return;
  }
  window.onscroll = function () {
    if (
      document.body.scrollTop >= 200 ||
      document.documentElement.scrollTop >= 200
    ) {
      myNav.classList.add("nav-colored");
      myNav.classList.remove("nav-transparent");
    } else {
      myNav.classList.add("nav-transparent");
      myNav.classList.remove("nav-colored");
    }
  };
}

window.addEventListener("scroll", reveal);
window.addEventListener("scroll", bar_color);

// To check the scroll position on page load
reveal();
bar_color();

/*stelle */
const stars = document.querySelectorAll(".star");
let rating = 0;

stars.forEach((star, index) => {
  star.addEventListener("click", () => {
    rating = index + 1;
    updateRating();
  });

  star.addEventListener("mouseover", () => {
    for (let i = 0; i <= index; i++) {
      stars[i].classList.add("hover");
    }
  });

  star.addEventListener("mouseout", () => {
    for (let i = 0; i <= index; i++) {
      stars[i].classList.remove("hover");
    }
  });
});

function updateRating() {
  for (let i = 0; i < stars.length; i++) {
    if (i < rating) {
      stars[i].classList.add("selected");
    } else {
      stars[i].classList.remove("selected");
    }
  }
}
