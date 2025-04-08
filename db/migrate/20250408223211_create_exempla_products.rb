class CreateExemplaProducts < ActiveRecord::Migration[8.0]
  def change
    drop_table(:exempla_products, if_exists: true)
    create_table :exempla_products do |t|
      t.timestamps
    end
  end
end
