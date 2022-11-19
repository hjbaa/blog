class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :diary

  has_rich_text :body
  has_many_attached :files

  validates :title, presence: true
  validates :body, presence: true

  scope :subscribed_by, ->(user) { where(author_id: Subscription.select(:followed_blogger_id).where(follower_id: user.id)).order(created_at: :desc) }

  acts_as_votable
end
