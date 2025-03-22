class CreateExemplaProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :exempla_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
