FactoryBot.define do
  factory :t_comment do
    t_text { Faker::Lorem.sentence }
    association :user
    association :tweet
  end
end
