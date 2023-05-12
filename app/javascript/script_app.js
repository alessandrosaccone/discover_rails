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
          title: "Your location",
        });

        map.setCenter(pos);
      },
      function (error) {
        handleLocationError(true, infoWindow, map.getCenter());
      }
    );
  }
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
  if (map.style.display == "none") {
    map.style.display = "block";
    container.style.display = "block";
  } else {
    map.style.display = "none";
    container.style.display = "none";
  }
}

init_map();

/*
function delete_s(titolo, nome, cognome, data, ora, lingua, citta) {
  $.ajax({
    type: "POST",
    url: "delete_schede.php",
    beforeSend: function () {},
    data: {
      title_p: titolo,
      nome_p: nome,
      cognome_p: cognome,
      data_p: data,
      ora_p: ora,
      lingua_p: lingua,
      citta_p: citta,
    },
  });
  location.reload();
}*/
