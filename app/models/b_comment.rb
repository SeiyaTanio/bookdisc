class BComment < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :b_text, presence: true, length: { maximum: 150 }
end
