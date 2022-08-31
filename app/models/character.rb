class Character < ApplicationRecord
  belongs_to :user
  belongs_to :race
  belongs_to :job
  belongs_to :room
  belongs_to :characteristics_list
  belongs_to :background
  has_many :skills, through: :character_skills
  has_many :spells, through: :character_spells
  has_many :gifts, through: :character_gifts
  has_many :equipments, through: :character_equipments
  validates :name, :age, :height, :level, :weight, :gender, presence: true
end
