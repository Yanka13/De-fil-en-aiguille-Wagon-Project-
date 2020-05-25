class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :project, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
