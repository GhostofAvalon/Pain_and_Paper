class Background < ApplicationRecord
  has_many :characters
  validates :name, :specificity, :story, presence: true
  validates :name, uniqueness: true
end
