class Lodging < ApplicationRecord
  belongs_to :trip, touch: true
  has_and_belongs_to_many :days, -> { order(date: :asc) }
  #has_many :days, -> { order(date: :asc) }, dependent: :nullify

  def start_date
    days.first&.date
  end
  
  def end_date
    days.last&.date
  end
  
  def assign_days(from:, to:)
    lodging_days = trip.days.where(date: from..to)
    self.days = lodging_days
  end
end
