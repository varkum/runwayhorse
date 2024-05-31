class RemoveLodgingFromDay < ActiveRecord::Migration[7.2]
  def change
    remove_column :days, :lodging_id
  end
end
