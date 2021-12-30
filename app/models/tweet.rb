class Tweet < ApplicationRecord
  belongs_to :user
  has_many :t_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :tweet_t_tags, dependent: :destroy
  has_many :t_tags, through: :tweet_t_tags
end
