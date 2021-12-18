class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :room_name, presence: true
end
