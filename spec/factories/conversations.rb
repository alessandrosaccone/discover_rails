FactoryBot.define do
  factory :conversation do
    sender_id { FactoryBot.build(:user).id }
    recipient_id { FactoryBot.build(:user).id }
  end
end
