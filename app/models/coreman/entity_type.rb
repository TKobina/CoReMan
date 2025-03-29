class EntityType < ApplicationRecord
  has_many :entities

  validates :value, uniqueness: true
end
