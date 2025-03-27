class EntityName < ApplicationRecord
  belongs_to :entity
  has_one :entity_name_type
end
