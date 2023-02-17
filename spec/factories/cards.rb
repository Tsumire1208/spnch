FactoryBot.define do
  factory :card do
    title {Faker::Team.name}
    memo {Faker::Lorem.sentence}
    association :list
  end
end
