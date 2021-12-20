FactoryBot.define do
  factory :room do
    room_name { 'テスト' }
    association :users
  end
end
