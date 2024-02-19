class CreateActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
