class Tweet < ApplicationRecord
  belongs_to :user
  has_many :t_comments
  has_many :likes

  validates :content, presence: true, length: { maximum: 150 }
end
