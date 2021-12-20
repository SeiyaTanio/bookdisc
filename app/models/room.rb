class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms, validate: false

  validates :room_name, presence: true, length: { maximum: 30 }
end
