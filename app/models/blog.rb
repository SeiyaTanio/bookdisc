class Blog < ApplicationRecord

  belongs_to :user
  has_many :b_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :article, presence: true
end
