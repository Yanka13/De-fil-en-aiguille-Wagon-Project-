class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :address, :string
    add_column :users, :category, :string
    add_column :users, :mask_maker, :boolean, default: false
  end
end
