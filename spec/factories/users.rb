FactoryBot.define do
    factory :user do
      id {1}
      name { "John Doe" }
      email { "john.doe@example.com" }
      encrypted_password { "encrypted_password" }
      iva { "123456789" }
      # Define other attributes if you want to test differently
    end

    factory :guide, class: User do 
      id {2}
      name { "John Doe" }
      email { "john.doe@example.com" }
      encrypted_password { "encrypted_password" }
      iva { "123456789" }
    end
  end
  