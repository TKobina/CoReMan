class CreateEntities < ActiveRecord::Migration[8.0]
  def change
    drop_table(:entities, if_exists: true)
    create_table :entities do |t|
      t.string :display_name
      t.text :description
      t.timestamps
    end
  end
end
