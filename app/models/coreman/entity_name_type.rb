class EntityNameType < ApplicationRecord
  has_many :entity_names
  validates :value, uniqueness: true
end
