function init_map() {
  var map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.7749, lng: -122.4194 },
    zoom: 8,
  });
}

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
