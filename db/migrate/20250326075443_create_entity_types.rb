class CreateEntityTypes < ActiveRecord::Migration[8.0]
  def change
    drop_table(:entity_types, if_exists: true)
    create_table :entity_types do |t|
      t.string :value
      t.text :description
      t.timestamps
    end
  end
end
