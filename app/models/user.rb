class User < ApplicationRecord
  has_one :diary, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  has_many :followers_bloggers_assignment, class_name: 'Subscription', foreign_key: :follower_id
  has_many :followed_bloggers, through: :followers_bloggers_assignment

  has_many :bloggers_followers_assignment, class_name: 'Subscription', foreign_key: :followed_blogger_id
  has_many :followers, through: :bloggers_followers_assignment, class_name: 'User', foreign_key: 'id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true
  validates :last_name, presence: true

  def author_of?(object)
    id == object.author_id
  end

  def subscribed_at?(user)
    followed_bloggers.include?(user)
  end
end
