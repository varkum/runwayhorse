class ChangeLodgingDayAssociation < ActiveRecord::Migration[7.2]
  def change
    remove_reference :lodgings, :day, index: true
    add_reference :lodgings, :trip, null: false, foreign_key: true
    
    add_reference :days, :lodging, null: true, foreign_key: true
  end
end
