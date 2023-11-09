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


### COSA MANCA
-FRONTEND
--Nella Home, se scorro tutto verso il basso e poi tutto verso l'alto la navbar rimane arancione anziché diventare trasparente. Se scendo di poco e risalgo ridiventa trasparente
--Bottone "Let me see the map" sia in Visite che in Guide
--Bottoni sulle schede fuori dalle schede in Visite: da ridimensionare
--Praticamente tutto tra form, sfondo e style generale del login/registrazione
--Tutte le chat sono da modificare

-LOGIN/REGISTRAZIONE
--Il check "Ricordami", funziona?
--Nel login capita che delle volte si blurrano le form
--Manca il messaggio di errore nel caso in cui tu voglia entrare ma non hai confermato la mail
--Manca il messaggio di errore di sbagliata mail e password
--Manca il messaggio di errore nel caso in cui io voglia fare login dopo aver eliminato il mio account

-MESSAGGI

-PAGAMENTI

-VISITE
--Vengono mostrati i post scaduti

-PROFILO
--Se clicco su change image senza aver selezionato un'immagine non dà errore o avvertimenti o popup
--Sarebbe carino implementare le azioni di cambio username o descrizione senza passare ad un'altra pagina
--Se elimino l'account siamo sicuri venga eliminato tutto coerentemente? C'è il controllo sull'impossibilità di eliminare un account se prenotato a qualche visita?

-API
--Google APIs non funziona (Mario se ne è andato, ed aveva già staccato la carta mi sa) -> DA RISOLVERE

-JOB
--Sistemare lo scheduling (ora è ogni minuto)

-NOTIFICHE