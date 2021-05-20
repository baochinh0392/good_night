class User < ApplicationRecord
  has_many :follow_friends, dependent: :destroy
  has_many :friends, through: :follow_friends
  has_many :followers, foreign_key: 'friend_id', class_name: 'User', dependent: :destroy
  has_many :sleep_operations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
