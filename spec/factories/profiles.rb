FactoryBot.define do
  factory :profile do
    favorite_book {Faker::Lorem.sentence}
    self_introduction {Faker::Lorem.sentence}
    association :user
  end
end
