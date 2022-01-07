class TweetForm
  include ActiveModel::Model

  attr_accessor( 
    :content, :user_id, :tweet_images,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :t_tag_name
  )

  validates :content, presence: true, length: { maximum: 150 }
  validates :tweet_images, length: { maximum: 4, message: "は4枚以下にしてください" }

  def save
    tweet = Tweet.create(content: content, user_id: user_id, tweet_images: tweet_images)
    t_tag = TTag.where(t_tag_name: t_tag_name).first_or_initialize
    t_tag.save
    TweetTTag.create(tweet_id: tweet.id, t_tag_id: t_tag.id)
  end

  def update(params, tweet)
    tweet.tweet_t_tags.destroy_all
    t_tag_name = params.delete(:t_tag_name)
    t_tag = TTag.where(t_tag_name: t_tag_name).first_or_initialize if t_tag_name.present?
    t_tag.save if t_tag_name.present?
    tweet.update(params)
    TweetTTag.create(tweet_id: tweet.id, t_tag_id: t_tag.id) if t_tag_name.present?
  end
end