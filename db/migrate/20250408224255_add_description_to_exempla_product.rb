class AddDescriptionToExemplaProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :exempla_products, :name, :string, null: false
  end
end
