class CreateEntityNames < ActiveRecord::Migration[8.0]
  def change
    drop_table(:entity_names, if_exists: true)
    create_table :entity_names do |t|
      t.string :value
      t.timestamps
    end
  end
end
