class Happening < ApplicationRecord
  belongs_to :day
  belongs_to :trip

  delegated_type :happeningable, types: %w[ Transportation Activity ], dependent: :destroy

  def self.record!(happeningable, trip:, date:, time:, notes:)
    day = trip.days.find_by(date: date)
    create! happeningable: happeningable, trip: trip, day: day, time: "#{date} #{time}", notes: notes
  end

  def date
    time&.to_date
  end

  def update_meta_attributes!(params)
    day = trip.days.find_by(date: params[:date])
    update!(day: day, time: "#{params[:date]} #{params[:time]}", notes: params[:notes])
  end
end
