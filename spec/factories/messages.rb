FactoryBot.define do
    factory :message do
      # Define attributes for the message
      content { 'Hello, world!' }
      # Add other attributes as needed
  
      # Define associations if applicable
      association :conversation
      association :user
    end
  end
  