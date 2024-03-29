FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email    { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 4)
    password { password }
    password_confirmation { password }
  end
end
