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

function init_map() {
  if (typeof google === "undefined") {
    setTimeout(init_map, 1000); // try again in 1 second
    return;
  } else {
    var map = new google.maps.Map(document.getElementById("mapDiv"), {
      center: { lat: 41.902782, lng: 12.496366 },
      zoom: 12,
    });
  }
  google.maps.event.addListenerOnce(map, "tilesloaded", function () {
    // Get the size of the map
    var mapWidth = document.getElementById("mapDiv").offsetWidth;
    var mapHeight = document.getElementById("mapDiv").offsetHeight;

    // Adjust the height of the map container element
    document.getElementById("mapDiv").style.height = mapHeight + "px";
  });
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
      function (position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };

        var marker = new google.maps.Marker({
          position: pos,
          map: map,
          icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
          title: "Your location",
        });

        map.setCenter(pos);
      },
      function (error) {
        handleLocationError(true, infoWindow, map.getCenter());
      }
    );
  }

  $.get("/guide_users.json", function (guides) {
    $.each(guides, function (index, guide) {
      var marker = new google.maps.Marker({
        position: { lat: parseFloat(guide.lat), lng: parseFloat(guide.long) },
        map: map,
        icon: "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
        title: guide.nome,
      });
    });
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}
function see_map() {
  var map = document.getElementById("mapDiv");
  var container = document.getElementById("map_container");

  if (map.style.display == "" || map.style.display == "block") {
    map.style.display = "none";
    container.style.display = "none";
  } else {
    map.style.display = "block";
    container.style.display = "block";
  }
}

init_map();
