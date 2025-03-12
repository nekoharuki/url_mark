class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true

  has_many :urls, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower_follows, class_name: 'Follow', foreign_key: 'follower_user_id', dependent: :destroy
  has_many :followed_follows, class_name: 'Follow', foreign_key: 'followed_user_id', dependent: :destroy

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    if user.new_record?
      existing_user = find_by(email: auth.info.email)
      if existing_user
        user = existing_user
        user.update(provider: auth.provider, uid: auth.uid)
      else
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = SecureRandom.hex(10)
        user.save
      end
    end
    user
  end
end
