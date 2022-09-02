class Spell < ApplicationRecord
  has_many :character_spells
  has_many :characters, through: :character_spells
  validates :name, :description, presence: true
end
