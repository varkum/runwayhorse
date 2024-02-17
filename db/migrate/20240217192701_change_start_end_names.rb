class ChangeStartEndNames < ActiveRecord::Migration[7.2]
  def change
    rename_column(:trips, :start, :start_date)
    rename_column(:trips, :end, :end_date)
  end
end
