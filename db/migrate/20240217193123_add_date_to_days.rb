class AddDateToDays < ActiveRecord::Migration[7.2]
  def change
    add_column :days, :date, :date
  end
end
