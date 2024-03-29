class Day < ApplicationRecord
  belongs_to :trip
  has_many :happenings
  has_one :lodging
  
  def previous
    trip.days.find_by(date: date - 1)
  end
    
  def next
    trip.days.find_by(date: date + 1)
  end
end
