class Room < ApplicationRecord
  belongs_to :user
  has_many :character
  validates :name, presence: true, uniqueness: true
end
