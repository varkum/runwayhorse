class CreateTransportations < ActiveRecord::Migration[7.2]
  def change
    create_enum :mode, ["draft", "published", "archived", "trashed"]
    create_table :transportations do |t|
      t.enum :mode, enum_type: "mode", null:false

      t.timestamps
    end
  end
end
