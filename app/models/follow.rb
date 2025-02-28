class Follow < ApplicationRecord
  belongs_to :user

  validates :follower_user, presence: true
  validates :followed_user, presence: true
end
