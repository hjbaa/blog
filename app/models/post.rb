class Post < ApplicationRecord
  # TODO: add action text

  belongs_to :author, class_name: 'User'
  belongs_to :diary

  validates :title, presence: true
  validates :body, presence: true
end
