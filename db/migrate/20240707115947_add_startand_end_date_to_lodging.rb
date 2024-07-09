class AddStartandEndDateToLodging < ActiveRecord::Migration[7.2]
  def change
    add_column :lodgings, :start_date, :date
    add_column :lodgings, :end_date, :date
  end
end
