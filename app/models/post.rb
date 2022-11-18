class Post < ApplicationRecord
  # TODO: add action text

  belongs_to :author, class_name: 'User'
  belongs_to :diary

  has_rich_text :body
  has_many_attached :files

  validates :title, presence: true
  validates :body, presence: true
end
