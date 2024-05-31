class Lodging < ApplicationRecord
  belongs_to :trip, touch: true
  has_many :days, -> { order(date: :asc) }, dependent: :nullify

  def start_date
    days.first&.date
  end
  
  def end_date
    days.last&.date
  end
  
  def assign_days(from:, to:)
    lodging_days = trip.days.where(date: from..to)
    lodging_days.update!(lodging_id: id)
  end
end
