class ChangeTimeToDateTime < ActiveRecord::Migration[7.2]
  def change
    remove_column :happenings, :time
    add_column :happenings, :time, :datetime
  end
end
