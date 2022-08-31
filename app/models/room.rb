class Room < ApplicationRecord
  belongs_to :user
  has_many :characters
  validates :name, presence: true, uniqueness: true
end
