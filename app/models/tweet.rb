class Tweet < ApplicationRecord
  belongs_to :user
  has_many :t_comments

  validates :content, presence: true, length: { maximum: 150 }
end
