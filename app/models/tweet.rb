class Tweet < ApplicationRecord
  belongs_to :user
  has_many :t_comments
  has_many :likes

  has_many :tweet_t_tags
  has_many :t_tags, through: :tweet_t_tags
end
