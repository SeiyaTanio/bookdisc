FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    article { Faker::Lorem.paragraph }
    association :user
  end
end
