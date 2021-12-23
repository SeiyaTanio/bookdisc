class TweetForm
  include ActiveModel::Model

  attr_accessor :content, :user_id

  validates :content, presence: true, length: { maximum: 150 }

  def save
    Tweet.create(content: content, user_id: user_id)
  end
end