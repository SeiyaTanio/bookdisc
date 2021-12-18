class Blog < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :article, presence: true
end
