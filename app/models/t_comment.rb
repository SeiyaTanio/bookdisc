class TComment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :t_text, presence: true, length: { maximum: 150 }
end
