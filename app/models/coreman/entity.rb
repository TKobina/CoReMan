class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_names, dependent: :destroy
  has_one :entity_types
end
