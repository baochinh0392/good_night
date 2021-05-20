class FollowFriend < ApplicationRecord
  belongs_to :user
  belongs_to :friend, foreign_key: 'friend_id', class: 'User'
end
