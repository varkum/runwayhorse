class AddTripRefToHappening < ActiveRecord::Migration[7.2]
  def change
    add_reference :happenings, :trip, index: true
  end
end
