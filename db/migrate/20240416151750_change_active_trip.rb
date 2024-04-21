class ChangeActiveTrip < ActiveRecord::Migration[7.2]
  def change
    remove_column :trips, :active
  end
end
