class Url < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true
  validates :genre, presence: true
end
