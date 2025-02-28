class Follow < ApplicationRecord
  belongs_to :follower_user, class_name: 'User', foreign_key: 'follower_user_id'
  belongs_to :followed_user, class_name: 'User', foreign_key: 'followed_user_id'

  validates :follower_user_id_id, presence: true
  validates :followed_user_id_id, presence: true
end
