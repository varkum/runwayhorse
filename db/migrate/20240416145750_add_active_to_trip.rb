class AddActiveToTrip < ActiveRecord::Migration[7.2]
  def change
    add_column :trips, :active, :boolean, default: false
  end
end
