class Skill < ApplicationRecord
  has_many :characters, through: :character_skills
  validates :name, :description, presence: true
end
