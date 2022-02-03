class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :favorite_book, length: { maximum: 150 }
  validates :self_introduction, length: { maximum: 150 }
end
