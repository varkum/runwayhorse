class Happening < ApplicationRecord
  belongs_to :day, touch: true
  belongs_to :trip, touch: true

  delegated_type :happeningable, types: %w[ Transportation Activity ], dependent: :destroy

  def date
    time&.to_date
  end
  
  def self.record(happeningable, happening_params, trip)
    day = trip.days.find_by(date: happening_params[:date])
    create!(
      happeningable: happeningable,
      trip: trip,
      day: day,
      time: "#{happening_params[:date]} #{happening_params[:time]}",
      notes: happening_params[:notes]
      )
  end

  def edit(happeningable_params, happening_params, trip)
    day = trip.days.find_by(date: happening_params[:date])
    update!(day: day,
    time: "#{happening_params[:date]} #{happening_params[:time]}",
    notes: happening_params[:notes]
    )
    
    happeningable.update! happeningable_params
  end
end
