class ConvertTimeToString < ActiveRecord::Migration[7.2]
  def change
    change_column :happenings, :time, :string
  end
end
