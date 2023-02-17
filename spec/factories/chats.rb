FactoryBot.define do
  factory :chat do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |chat|
      chat.image.attach(io: File.open('public/images/SPN-ch.PNG'), filename: 'SPN-ch.PNG')
    end
  end
end
