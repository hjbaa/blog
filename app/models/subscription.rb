class Subscription < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_blogger, class_name: 'User'
end
