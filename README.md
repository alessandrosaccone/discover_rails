# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

Rails 7.0.4.3
Ruby version ruby 2.7.2p137

# Google Maps API Key

AIzaSyD4CVx_y35NwW07nB7CCOi0HLQu44HVov0

# Stripe

Email:palumbosimone80@gmail.com
password:AleSimMarGab123
<<<<<<< HEAD
Per creare account guide si deve essere in test mode e lo si fa in connect e si devono dare molte informazioni.
Per ora solo Jacke Jacke va. Non so se con la commit cambierà.
=======
Per creare account guide si deve essere in test mode e lo si fa in connect. Si devono dare molte informazioni.
Per ora solo Jacke Jacke va. Non so se con la commit cambierà.

> > > > > > > 20ac660 (aggiorno)

# Per gabriele

Mi servirebbe che tu leggessi in script_guide.js il commento prima dell'ultima funzione. Sai tu dove implementare
un js che controlli se sei loggato: appena lo sei fai partire quella funzione (copia tutto il codice da sotto il
commento in poi là)

# Per alessandro

togli da script_app.js

# Per simone

1. c'è una riga di codice commentata in posts/show.html.erb
   c'è una riga di codice commentata in posts/show.html.erb--> Ho visto il commento. Che devo fare?
   Sai perché? Dicevo a te perché la form è tua, ed il mio submit non ha effetto... verifica se trovi il problema

2. Per il price devi chiamare l'action "get_price" che sta in posts_controller.rb. Dovrebbe restituire in json il valore
   di price. Se hai problemi copia la formula e crea un'action come "get_price_variable", così la ritorni sotto forma
   di variabile.

# Per Mario

quando la guida compila la form per un post nella via ci deve essere un controllo che la viq esista di
google maps

# Per alessandro

Mi devi creare una variabile che rappresenta il costo del biglietto usando la tua formula. Quella che hai creato come @price non so come l'hai definita perchè non si trova nell'azione show del controller. Devo avere un campo come questo nella form: <%= hidden_field_tag :price,value=@price %>. Ho provato questo ma non va: non andava più nemmeno il pricing dinamico.

# Per chi ha il coraggio di farlo

Il sistema di pagamento è praticamente finito. Manca solo una cosa. Le application fee non vanno a nessuno ma
dovrebbero andare a noi. Quando qualcuno vuole provarlo a fare, io ci sono. Forse non serve per l'esame cmq.
Potremmo fare che va tutto alla guida.
