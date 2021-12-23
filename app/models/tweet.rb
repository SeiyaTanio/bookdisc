class Tweet < ApplicationRecord
  belongs_to :user
  has_many :t_comments
  has_many :likes

  
end
