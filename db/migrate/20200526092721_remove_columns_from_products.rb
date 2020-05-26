class RemoveColumnsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :details
    remove_column :products, :price
  end
end
