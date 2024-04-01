class CreateSometimes < ActiveRecord::Migration[7.2]
  def change
    create_table :sometimes do |t|
      t.belongs_to :trip, null: false, foreign_key: true
      t.string :name
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
