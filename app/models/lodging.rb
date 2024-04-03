class Lodging < ApplicationRecord
  belongs_to :trip
  has_many :days, -> { order(date: :asc )}
  
  def assign_days(from:, to:)
    lodging_days = trip.days.where(date: from..to)
    lodging_days.update!(lodging_id: id)
  end
end
