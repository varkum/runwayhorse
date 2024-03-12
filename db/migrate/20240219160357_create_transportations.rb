class CreateTransportations < ActiveRecord::Migration[7.2]
  def change
    create_table :transportations do |t|
      t.integer :mode
      t.timestamps
    end
  end
end
