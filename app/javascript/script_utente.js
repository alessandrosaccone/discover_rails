function button_2() {
  document.getElementById("view_area").style.display = "block";
  var rimozione = document.getElementById("lista");
  rimozione.style.display = "flex";
}

document.addEventListener("DOMContentLoaded", function () {
  var script_element = document.querySelector("script[data-controller-url]");
  var controller_url = script_element.dataset.controllerUrl;
  /*     var controller_delete_url = script_element.dataset.controllerUrl2; */

  var token = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content");
  var button_post = document.getElementById("view");
  var lista = document.getElementById("lista");
  button_post.addEventListener("click", function () {
    fetch(controller_url, {
      method: "POST",
      headers: {
        "Content-Type": "multipart/form-data",
        "X-CSRF-Token": token,
      },
    })
      .then(function (response) {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error("error");
        }
      })
      .then(function (data) {
        data.forEach(function (booking) {
          // Creazione dell'elemento li
          var li = document.createElement("li");
          li.classList.add("card");
          li.id = booking.id;

          // Creazione dell'elemento h3.card-title
          var h3 = document.createElement("h3");
          h3.classList.add("card-title");
          li.appendChild(h3);

          // Aggiunta del testo all'ID del biglietto
          var idText = document.createTextNode("ID biglietto: " + booking.id);
          h3.appendChild(idText);

          // Creazione dell'elemento div.card-content
          var divContent = document.createElement("div");
          divContent.classList.add("card-content");
          li.appendChild(divContent);

          // Creazione dell'elemento p per il numero di persone
          var p = document.createElement("p");
          var numPersoneText = document.createTextNode(
            "Numero di persone: " + booking.num_pers
          );
          p.appendChild(numPersoneText);
          divContent.appendChild(p);

          // Creazione dell'elemento p per il prezzo
          var pPrezzo = document.createElement("p");
          var prezzoText = document.createTextNode(
            "Prezzo: " + booking.amount + "$"
          );
          pPrezzo.appendChild(prezzoText);
          divContent.appendChild(pPrezzo);

          // Aggiunta del container alla lista
          lista.appendChild(li);

          // Creazione dell'elemento div.card-link-wrapper
          var divLinkWrapper = document.createElement("div");
          divLinkWrapper.classList.add("card-link-wrapper");
          li.appendChild(divLinkWrapper);

          // Creazione del link per ulteriori dettagli
          var link = document.createElement("a");
          link.href = "/bookings/" + booking.id; // Inserisci l'URL corretto per i dettagli del booking
          link.textContent = "Ulteriori dettagli";
          divLinkWrapper.appendChild(link);

          var divLinkWrapper2 = document.createElement("div");
          divLinkWrapper2.classList.add("card-link-wrapper");
          li.appendChild(divLinkWrapper2);

          var link2 = document.createElement("a");
          link2.href = "/posts/" + booking.post_id;
          link2.textContent = "Vedi post prenotato";
          divLinkWrapper2.appendChild(link2);
        });
      });
  });
});
