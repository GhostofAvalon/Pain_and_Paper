class Character < ApplicationRecord
  belongs_to :user
  belongs_to :race
  belongs_to :class
  belongs_to :room
  belongs_to :characteristic_list
  belongs_to :background
end
