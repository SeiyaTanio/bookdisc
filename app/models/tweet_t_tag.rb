class TweetTTag < ApplicationRecord
  belongs_to :tweet
  belongs_to :t_tag
end
