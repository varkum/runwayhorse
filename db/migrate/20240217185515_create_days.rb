class CreateDays < ActiveRecord::Migration[7.2]
  def change
    create_table :days do |t|
      t.string :homebase
      t.string :location
      t.text :notes
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
