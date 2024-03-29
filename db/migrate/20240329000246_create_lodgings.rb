class CreateLodgings < ActiveRecord::Migration[7.2]
  def change
    create_table :lodgings do |t|
      t.string :name
      t.string :address
      t.string :link
      t.belongs_to :day, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
