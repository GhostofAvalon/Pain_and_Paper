class Equipment < ApplicationRecord
  has_many :characters, trought: :character_equipments
  validates :name, :description, presence: true
end
