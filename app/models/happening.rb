class Happening < ApplicationRecord
  belongs_to :day, touch: true
  belongs_to :trip, touch: true

  delegated_type :happeningable, types: %w[ Transportation Activity ], dependent: :destroy

  def self.record(happeningable, happening_params)
    day = trip.days.find_by(date: happening_params[:date])
    create!(
      happeningable: happeningable,
      trip: happening_params[:trip],
      day: happening_params[:day],
      time: "#{happening_params[:date]} #{happening_params[:time]}",
      notes: happening_params[:notes]
      )
  end

  def date
    time&.to_date
  end

  def edit(happeningable_params:, happening_params:)
    day = trip.days.find_by(date: happening_params[:date])
    update!(day: day,
    time: "#{happening_params[:date]} #{happening_params[:time]}",
    notes: happening_params[:notes]
    )
    happeningable.update! happeningable_params
  end
  
  def update_meta_attributes!(params)
    day = trip.days.find_by(date: params[:date])
    update!(day: day, time: "#{params[:date]} #{params[:time]}", notes: params[:notes])
  end
end
