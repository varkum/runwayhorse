class RemoveHomebaseFromDay < ActiveRecord::Migration[7.2]
  def change
    remove_column :days, :homebase
  end
end
