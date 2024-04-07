class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip
  
  delegated_type :happeningable, types: %w[ Transportation Activity ], dependent: :destroy
   
  def date
    time&.to_date
  end
  
  def self.record!(happeningable, trip:, date:, time:, notes:, booked:)
    day = trip.days.find_by(date: date)
    create! happeningable: happeningable, trip: trip, day: day, time: "#{date} #{time}", notes: notes, booked: booked
  end
end
