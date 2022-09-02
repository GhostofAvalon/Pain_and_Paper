class CharacterGift < ApplicationRecord
  belongs_to :gift
  belongs_to :character
end
