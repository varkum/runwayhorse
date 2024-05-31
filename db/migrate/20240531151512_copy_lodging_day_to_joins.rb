class CopyLodgingDayToJoins < ActiveRecord::Migration[7.2]
  def up
    Day.find_each do |day|
      if day.lodging_id
        execute "INSERT INTO days_lodgings (day_id, lodging_id) VALUES (#{day.id}, #{day.lodging_id})"
      end
    end
  end
  
  def down
    execute "DELETE FROM days_lodgings"
  end
end
