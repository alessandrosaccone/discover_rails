FactoryBot.define do
    factory :user do
      name { "John Doe" }
      email { "john.doe@example.com" }
      encrypted_password { "encrypted_password" }
      iva { "123456789" }
      # Define other attributes if you want to test differently
    end
  end
  