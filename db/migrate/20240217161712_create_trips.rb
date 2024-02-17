class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
