class AddNotesToTrips < ActiveRecord::Migration[7.2]
  def change
    add_column :trips, :notes, :text
  end
end
