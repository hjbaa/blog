class User < ApplicationRecord
  # TODO: add avatar
  # TODO: add votes mechanism (https://github.com/ryanto/acts_as_votable)

  has_one :diary, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true
  validates :last_name, presence: true
end
