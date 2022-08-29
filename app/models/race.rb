class Race < ApplicationRecord
  has_many :characters
  validates :name, :description, presence: true
end
