class Day < ApplicationRecord
  belongs_to :trip
  belongs_to :lodging, optional: true
  has_many :happenings, -> { order(time: :asc) }, dependent: :destroy
  
  def previous
    trip.days.find_by(date: date - 1)
  end
    
  def next
    trip.days.find_by(date: date + 1)
  end
end
