class Diary < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :posts, dependent: :destroy
end
