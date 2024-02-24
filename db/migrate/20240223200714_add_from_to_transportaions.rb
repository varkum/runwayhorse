class AddFromToTransportaions < ActiveRecord::Migration[7.2]
  def change
    add_column(:transportations, :origin, :string)
    add_column(:transportations, :destination, :string)
  end
end
