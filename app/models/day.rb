class Day < ApplicationRecord
  belongs_to :trip
  has_many :happenings
  
  def previous
    trip.days.find_by(date: date - 1)
  end
    
  def next
    trip.days.find_by(date: date + 1)
  end
end
