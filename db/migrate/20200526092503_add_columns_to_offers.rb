class AddColumnsToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :description, :text
    add_column :offers, :price, :float
  end
end
