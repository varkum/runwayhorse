class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip
  
  delegated_type :happeningable, types: %w[ Transportation Activity ]
  
  def date
    day&.date
  end
  
  def self.create_transportation(trip:, date:, time:, transport_mode:, notes:)
    day = trip.days.find_by(date: date)
    create! happeningable: Transportation.new(mode: transport_mode), trip: trip, day: day, time: time, notes: notes
  end
  
  def self.create_activity(trip:, name:, location:, date:, time:, notes:, booked:)
    day = trip.days.find_by(date: date)
    create! happeningable: Activity.new(name: name, location: location), trip: trip, day: day, time: time, notes: notes
  end
end
