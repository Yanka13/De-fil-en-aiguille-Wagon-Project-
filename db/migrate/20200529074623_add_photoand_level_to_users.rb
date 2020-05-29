class AddPhotoandLevelToUsers < ActiveRecord::Migration[6.0]
  def change
        add_column :users, :photo, :text
        add_column :users, :level, :string, default: "Couturier junior"
  end
end
