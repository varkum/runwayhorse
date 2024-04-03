class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip
  
  delegated_type :happeningable, types: %w[ Transportation Activity ], dependent: :destroy
  
  default_scope { order(time: :asc) }
  scope :timed, -> { where.not(time: "") }
  scope :sometime, -> { where(time: "") }
  
  def date
    day&.date
  end
  
  def time
    datetime = "#{date.to_s} #{read_attribute(:time)}"
    datetime.match?(/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/) ? Time.new(datetime << ":00") : nil
  end
  
  def self.record!(happeningable, trip:, date:, time:, notes:, booked:)
    day = trip.days.find_by(date: date)
    create! happeningable: happeningable, trip: trip, day: day, time: time, notes: notes, booked: booked
  end
end
