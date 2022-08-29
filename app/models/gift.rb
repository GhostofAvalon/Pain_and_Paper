class Gift < ApplicationRecord
  has_many :characters, trought: :character_gifts
  validates :name, :description, presence: true
end
