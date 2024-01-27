class Pokemon < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true
  validates :pokemonType, presence: true
  validates :description, presence: true
end