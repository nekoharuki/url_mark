class Follow < ApplicationRecord
  validates :follower_user, presence: true
  validates :followed_user, presence: true
end
