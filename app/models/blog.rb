class Blog < ApplicationRecord

  belongs_to :user
  has_many :b_comments, dependent: :destroy
  has_one_attached :blog_image

  validates :title, presence: true, length: { maximum: 50 }
  validates :article, presence: true
end
