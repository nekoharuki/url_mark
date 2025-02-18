class Url < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true
  validates :cnt, presence: true
end
