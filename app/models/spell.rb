class Spell < ApplicationRecord
  has_many :characters, trought: :character_spells
  validates :name, :description, presence: true
end
