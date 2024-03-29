class Lodging < ApplicationRecord
  belongs_to :day
  
  def trip
    day.trip
  end
end
