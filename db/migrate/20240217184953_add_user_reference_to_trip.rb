class AddUserReferenceToTrip < ActiveRecord::Migration[7.2]
  def change
    add_reference :trips, :user, foreign_key: true, null: false
  end
end
