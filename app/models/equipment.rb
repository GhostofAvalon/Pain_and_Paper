class Equipment < ApplicationRecord
  has_many :characters, through: :character_equipments
  validates :name, :description, presence: true
end
