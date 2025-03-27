class CreateEntityNameTypes < ActiveRecord::Migration[8.0]
  def change
    drop_table(:entity_name_types, if_exists: true)
    create_table :entity_name_types do |t|
      t.string :value
      t.timestamps
    end
  end
end
