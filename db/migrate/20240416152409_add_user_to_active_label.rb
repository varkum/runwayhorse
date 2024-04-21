class AddUserToActiveLabel < ActiveRecord::Migration[7.2]
  def change
    add_reference :active_labels, :user, foreign_key: true, index: true, null: false
  end
end
