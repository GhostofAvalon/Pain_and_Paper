class Gift < ApplicationRecord
  has_many :characters, through: :character_gifts
  validates :name, :description, presence: true
end
