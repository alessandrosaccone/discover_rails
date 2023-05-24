FactoryBot.define do
    factory :post do
      descrizione { "Sample description" }
      titolo { "Sample title" }
      data { DateTime.now }
      ora { Time.now }
      lingua { "English" }
      persone { 2 }
      prezzo { 100 }
      nomeC { "Sample nomeC" }
      regioneC { "Sample regioneC" }
      nomeP { "Sample nomeP" }
      numero_ore { 2 }
      persone_rimanenti { 5 }
      user_email { "sample@example.com" }
      user
      address { "Sample address" }
    end
  end
  