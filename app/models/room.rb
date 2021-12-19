class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms, validate: false

  validates :room_name, presence: true
end
