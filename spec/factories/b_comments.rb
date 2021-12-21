FactoryBot.define do
  factory :b_comment do
    b_text { Faker::Lorem.sentence }
    association :user
    association :blog
  end
end
