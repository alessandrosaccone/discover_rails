FactoryBot.define do
    factory :booking do
      association :user
      association :post
      stripe_charge_id { "stripe_charge_id_123" }
      refunded { false }
      num_pers { 2 }
      expired { false }
      amount { 100.0 }
    end
  end
  