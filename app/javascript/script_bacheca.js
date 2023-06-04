function button() {
    document.getElementById("form").style.display = "block";
    document.getElementById("view_area").style.display = "none";
    var rimozione = document.getElementById('lista');
    rimozione.style.display = 'none';
}
  
  function button_2() {
    document.getElementById("view_area").style.display = "block";
    document.getElementById("form").style.display = "none";
    var rimozione = document.getElementById('lista');
    rimozione.style.display = 'flex';
  }


function deletePost(url, id, token){
  
  fetch(url, {
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': token
    },
    body: JSON.stringify({id: id}), 
  })
  .then(function(response){
    if(response.ok){
      
      var rimuovi = document.getElementById(id);
      rimuovi.remove();
    }
    else{
      throw new Error('error')
    }
  
  })
}

document.addEventListener('DOMContentLoaded', function(){
  var script_element = document.querySelector('script[data-controller-url]');
  var controller_url = script_element.dataset.controllerUrl;
  var controller_delete_url = script_element.dataset.controllerUrl2;

  var token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  var button_post = document.getElementById('view');
  var lista = document.getElementById('lista');
  button_post.addEventListener('click', function(){
    fetch(controller_url, {
      method: 'POST',
      headers: {
        'Content-Type': 'multipart/form-data',
        'X-CSRF-Token': token
      },
    })
    .then(function(response){
      if(response.ok){
        return response.json()
      }
      else{
        throw new Error('error')
      }
    
    })
    .then(function(data){
      console.log(data)
      data.forEach(function(post){
        //QUI LA ROBA

        // Creazione dell'elemento li
        var li = document.createElement('li');
        li.classList.add('card');
        li.id = post.id;

        // Creazione dell'elemento div.card_image
        var divImage = document.createElement('div');
        divImage.classList.add('card_image');
        li.appendChild(divImage);

        // Creazione dell'elemento h3.card-title
        var h3 = document.createElement('h3');
        h3.classList.add('card-title');
        li.appendChild(h3);

        // Aggiunta del testo al titolo
        var titoloText = document.createTextNode(post.titolo);
        h3.appendChild(titoloText);

        // Creazione dell'elemento div.card-content
        var divContent = document.createElement('div');
        divContent.classList.add('card-content');
        li.appendChild(divContent);

        // Creazione dell'elemento p per la descrizione
        var p = document.createElement('p');
        var descrizioneText = document.createTextNode(post.descrizione);
        p.appendChild(descrizioneText);
        divContent.appendChild(p);

        // Aggiunta di un elemento hr
        var hr = document.createElement('hr');
        divContent.appendChild(hr);

        // Creazione dell'elemento h4 per la città
        var h4Citta = document.createElement('h4');
        var cittaText = document.createTextNode('Città: '+ post.nomeC);
        h4Citta.appendChild(cittaText);
        divContent.appendChild(h4Citta);

        // Creazione dell'elemento div.card-languages
        var divLanguages = document.createElement('div');
        divLanguages.classList.add('card-languages');
        li.appendChild(divLanguages);

        var btn_del = document.createElement('button');
        btn_del.classList.add('dropdown-icon');
        li.appendChild(btn_del)
        btn_del.addEventListener('click',function(){
          var conferma = confirm('Sei sicuro di voler eliminare?');
            if (conferma) {
              deletePost(controller_delete_url,post.id, token);
              console.log(post.id)
            }
        });

        // Creazione dell'elemento h4 per la lingua e la data
        var h4LinguaData = document.createElement('h4');
        var linguaText = document.createTextNode('Lingua: ');
        var spanLingua = document.createElement('span');
        spanLingua.style.fontWeight = 'normal';
        spanLingua.innerHTML = post.lingua;
        var br1 = document.createElement('br');
        var dataOraText = document.createTextNode('Data e ora: ');
        var spanDataOra = document.createElement('span');
        spanDataOra.style.fontWeight = 'normal';
        spanDataOra.innerHTML = post.data+" "+ post.ora;
        h4LinguaData.appendChild(linguaText);
        h4LinguaData.appendChild(spanLingua);
        h4LinguaData.appendChild(br1);
        h4LinguaData.appendChild(dataOraText);
        h4LinguaData.appendChild(spanDataOra);
        divLanguages.appendChild(h4LinguaData);

        // Creazione dell'elemento div.card-link-wrapper
        var divLinkWrapper = document.createElement('div');
        divLinkWrapper.classList.add('card-link-wrapper');
        li.appendChild(divLinkWrapper);

        // Creazione del link per il prezzo totale
        var prezzo = document.createElement('span');
        prezzo.innerHTML = "Prezzo: " + post.prezzo + "$";
        divLinkWrapper.appendChild(prezzo);
        lista.appendChild(li)

      })
    })

  })
})

