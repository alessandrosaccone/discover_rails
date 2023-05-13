var swiper = new Swiper(".mySwiper", {
  effect: "coverflow",
  grabCursor: true,
  centeredSlides: true,
  slidesPerView: "auto",
  coverflowEffect: {
    rotate: 0,
    stretch: 0,
    depth: 300,
    modifier: 1,
    slideShadows: false,
  },
  pagination: {
    el: ".swiper-pagination",
  },
});

/* Da Mettere quando accedi alla bacheca / quando fai login */
function init_position() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
      };

      // Send POST request to Rails controller
      $.ajax({
        type: "POST",
        url: "/resource/update_location", // Change this to your Rails controller action URL
        data: { lat: pos.lat, lng: pos.lng },
        success: function () {
          console.log("Location saved successfully");
        },
        error: function () {
          console.log("Error saving location");
        },
      });
    });
  }
}

init_position();
