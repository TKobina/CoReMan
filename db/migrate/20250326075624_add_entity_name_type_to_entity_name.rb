class AddEntityNameTypeToEntityName < ActiveRecord::Migration[8.0]
  def change
    add_reference :entity_names, :entity_name_type, null: false, foreign_key: true
    add_reference :entity_names, :entity, null: false, foreign_key: true
  end
end
