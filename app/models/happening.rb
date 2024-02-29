class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip
  
  delegated_type :happeningable, types: %w[ Transportation Activity ]
  
  default_scope { order(time: :desc) }
  
  def date
    day&.date
  end
  
  def time
    datetime = "#{date.to_s} #{read_attribute(:time)}"
    datetime.present? ? Time.new(datetime << ":00") : nil
  end
  
  def self.record!(happeningable, trip:, date:, time:, notes:, booked:)
    day = trip.days.find_by(date: date)
    create! happeningable: happeningable, trip: trip, day: day, time: time, notes: notes, booked: booked
  end
end
