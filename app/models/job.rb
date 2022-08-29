class Job < ApplicationRecord
  has_many :characters
  validates :name, :description, presence: true
end
