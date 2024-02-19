class CreateHappenings < ActiveRecord::Migration[7.2]
  def change
    create_table :happenings do |t|
      t.belongs_to :day, null: false, foreign_key: true
      t.datetime :time
      t.text :notes
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
