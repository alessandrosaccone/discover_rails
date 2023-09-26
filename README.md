## README

# Versions

Rails 7.0.4.3
Ruby version ruby 2.7.2p137

# Google Maps API Key

email: AIzaSyD4CVx_y35NwW07nB7CCOi0HLQu44HVov0

# Stripe

email:palumbosimone80@gmail.com
continuo_email:AleSimMarGab123

# Email -> SendGrind

email: discover.mailproject@gmail.com
continuo_email: Xp[(-m(M1T'95poM

# Test

1. bundle exec rspec spec/controllers/email_controller_spec.rb
2. bundle exec rspec spec/controllers/post_controller_spec.rb
3. bundle exec rspec spec/controllers/conversation_controller_spec.rb

# checkout

b1427078e34197099eca9ad8ecedc5a7635171a7

# COMPITI

- modifica il perform in jobs/every_tf_job.rb

# marius

- mi serve che curi il layout della mail "Date Exceeded". è una mail che specifica all'utente che non può più chiedere un refund perché è il giorno prima della visita. Devi modificare app/views/user_mailer/date_exceeded_email.html.erb. Cerca di fare una bella mail, magari mettici in mezzo pure qual è la visita o anche inizia con "Ciao [nome_utente]! "
- metti nel front-end nel form di creazione delle visite un vincolo sull'orario (solo ore con mezzora annessa)
- apri il server, vai sul profilo di una guida e crea un post. ora vedrai un nuovo campo "persone last-minute". Vorrei che affianco al checkbutton con scritto "Rendi obbligatorio" ci sia un'icona quella delle informazioni, che se ci vai sopra fa uscire un box che ti spiega cosa sono le persone Last_Minute.
  -fai quello che vuoi ma migliorami la pagina di registrazione dell guida. Non è urgente. Nel frontend serviranno controlli su codicefiscale ecc.

# Per Simone

Ho bisogno di queste informazioni per account guida:  
nome della banca (forse non serve) e, se la banca è all'estero, devo inserire anche la valuta: Vedere se aggiungere campo. Intanto test euro.
Aggiungere Controlli in caso di campi errati.

Il mio job invia una mail quando non puoi più fare il refund di un booking. Ma non credo abbiamo permesso
in effetti di fare in modo che questo refund venga eliminato. Discutiamone, lasciami il codice da aggiungere al mio job, e poi verificherò (immagino si tratti di un parametro da modificare tipo refundable: false, ma chiedo per evitare problemi)
