class TweetForm
  include ActiveModel::Model

  attr_accessor( 
    :content, :user_id,
    :id, :created_at, :datetime, :updated_at, :datetime
  )

  validates :content, presence: true, length: { maximum: 150 }

  def save
    Tweet.create(content: content, user_id: user_id)
  end

  def update(params, tweet)
    tweet.update(params)
  end
end