class CreateJoinTableDaysLodgings < ActiveRecord::Migration[7.2]
  def change
    create_join_table :days, :lodgings do |t|
      t.index [:day_id, :lodging_id]
      t.index [:lodging_id, :day_id]
    end
  end
end
