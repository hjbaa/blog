class Diary < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :posts, dependent: :destroy

  validates :description, presence: true
end
