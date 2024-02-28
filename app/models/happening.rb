class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip
  
  delegated_type :happeningable, types: %w[ Transportation Activity ]
  
  default_scope { order(time: :asc) }
  
  def time
    time = read_attribute(:time)
    time ? Time.new(time) : nil
  end
  
  def date
    day&.date
  end
  
  def self.record!(happeningable, trip:, date:, time:, notes:, booked:)
    day = trip.days.find_by(date: date)
    create! happeningable: happeningable, trip: trip, day: day, time: time, notes: notes, booked: booked
  end
end
