class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :blogs
  has_one :profile
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  has_many :t_comments
  has_many :b_comments
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :rerationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship' , foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が無効です。半角英字と半角数字の両方が必要です。'
end
