class Skill < ApplicationRecord
  has_many :characters, trought: :character_skills
  validates :name, :description, presence: true
end
