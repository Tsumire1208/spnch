FactoryBot.define do
  factory :list do
    title {Faker::Team.name}
    association :user

  end
end
