class CreateActiveLabels < ActiveRecord::Migration[7.2]
  def change
    create_table :active_labels do |t|
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
