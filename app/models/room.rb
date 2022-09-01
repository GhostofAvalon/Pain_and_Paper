class Room < ApplicationRecord
  belongs_to :user
  has_many :characters
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
