class TTag < ApplicationRecord
  has_many :tweet_t_tags
  has_many :tweets, through: :tweet_t_tags

  validates :t_tag_name, uniqueness: true
end
