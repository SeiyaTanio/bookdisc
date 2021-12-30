class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms, validate: false
  has_many :messages, dependent: :destroy
  has_one_attached :room_image

  validates :room_name, presence: true, length: { maximum: 30 }
  validates :user_ids, length: { minimum: 2 }
end
