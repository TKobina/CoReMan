class AddEmailConfirmationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirmed_email, :boolean, null: false
  end
end
