class Background < ApplicationRecord
  has_many :characters
  validates :name, :specificity, presence: true
  validates :name, uniqueness: true
end
