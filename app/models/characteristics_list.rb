class CharacteristicsList < ApplicationRecord
  has_many :characters
  validates :force_value, :dexterity_value, :constitution_value, :intelligence_value, :wisdom_value, :charisma_value, presence: true
end
