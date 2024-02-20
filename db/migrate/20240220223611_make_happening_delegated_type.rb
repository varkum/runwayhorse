class MakeHappeningDelegatedType < ActiveRecord::Migration[7.2]
  def change
    change_table :happenings do |t|
      t.references :happeningable, polymorphic: true, null: false
    end
  end
end
