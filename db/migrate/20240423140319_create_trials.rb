class CreateTrials < ActiveRecord::Migration[7.2]
  def change
    create_table :trials do |t|
      t.date :started_on
      t.belongs_to :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
