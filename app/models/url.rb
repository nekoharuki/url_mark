class Url < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :link, presence: true
  validates :genre, presence: true

  has_many :goods, dependent: :destroy
  has_many :likes, dependent: :destroy

  def user
      User.find_by(id: self.user_id)
  end
end
