class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が無効です。8文字以上で半角英字と半角数字の両方が必要です。'

  has_many :tweets
  has_many :blogs
  has_one :profile
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  has_many :t_comments
  has_many :b_comments
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship' , foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  has_many :likes
  has_many :favorites, through: :likes, source: :tweet
  has_many :sns_credentials

  def follow(other_user)
    return if self == other_user
    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.include?(user)
  end

  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end

  def own?(object)
    id == object.user_id
  end

  def like(tweet)
    likes.find_or_create_by(tweet: tweet)
  end

  def like?(tweet)
    favorites.include?(tweet)
  end

  def unlike(tweet)
    favorites.delete(tweet)
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
  
end
