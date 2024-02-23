class ChangeEnumColumnType < ActiveRecord::Migration[7.2]
  def change
    remove_column(:transportations, :mode)
    drop_enum(:mode)
    
    add_column(:transportations, :mode, :integer)
  end
end
