FactoryBot.define do
    factory :post do
      descrizione { "Sample description" }
      titolo { "Sample title" }
      data { DateTime.now }
      ora { Time.now }
      lingua { "Inglese" }
      persone { 5 }
      prezzo { 100 }
      nomeC { "Roma" }
      regioneC { "Lazio" }
      nomeP { "Roma" }
      numero_ore { 2 }
      persone_rimanenti { 5 }
      user_email { "sally@example.com" }
      address { "Via G. Paone" }
      id {1}
  
      after(:build) do |post|
        post.persone_rimanenti = post.persone
      end
    end
  end
  