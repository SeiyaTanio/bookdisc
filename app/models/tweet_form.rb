class TweetForm
  include ActiveModel::Model

  attr_accessor( 
    :content, :user_id,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :t_tag_name
  )

  validates :content, presence: true, length: { maximum: 150 }

  def save
    tweet = Tweet.create(content: content, user_id: user_id)
    t_tag = TTag.where(t_tag_name: t_tag_name).first_or_initialize
    t_tag.save
    TweetTTag.create(tweet_id: tweet.id, t_tag_id: t_tag.id)
  end

  def update(params, tweet)
    tweet.update(params)
  end
end