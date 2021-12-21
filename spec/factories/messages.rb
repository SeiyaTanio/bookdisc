FactoryBot.define do
  factory :message do
    sentence {Faker::Lorem.sentence}
    association :user
    association :room
  end
end
