class AddArrivalToTransportations < ActiveRecord::Migration[7.2]
  def change
    add_column :transportations, :arrival, :datetime
  end
end
