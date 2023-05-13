function geocodeAddress(address, callback) {
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({ address: address }, function (results, status) {
    if (status === "OK") {
      callback(results[0].geometry.location);
    } else {
      console.log(
        "Geocode was not successful for the following reason: " + status
      );
    }
  });
}

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

        marker.addListener("click", function () {
          var infowindow = new google.maps.InfoWindow({
            content: "Qui sei tu!",
          });
          infowindow.open(map, marker);
        });

        map.setCenter(pos);
      },
      function (error) {
        handleLocationError(true, infoWindow, map.getCenter());
      }
    );
  }

  $.getJSON("/posts/all", function (posts) {
    $.each(posts, function (index, post) {
      var address = post.address;
      geocodeAddress(address, function (location) {
        console.log("location: " + location.lat());
        console.log("location: " + location.lng());
        var marker = new google.maps.Marker({
          position: {
            lat: parseFloat(location.lat()),
            lng: parseFloat(location.lng()),
          },
          map: map,
          icon: "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
          title: post.titolo,
        });

        google.maps.event.addListener(marker, "click", function () {
          var contentString =
            '<div id="content">' +
            "<h3>" +
            post.titolo +
            "</h3>" +
            '<div id="bodyContent">' +
            '<p><a href="/posts/' +
            post.id +
            '">See post</a></p>' +
            "</div>" +
            "</div>";
          var infowindow = new google.maps.InfoWindow({
            content: contentString,
          });
          infowindow.open(map, marker);
        });
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
  if (map.style.display == "none") {
    map.style.display = "block";
    container.style.display = "block";
  } else {
    map.style.display = "none";
    container.style.display = "none";
  }
}

init_map();
init_position();
