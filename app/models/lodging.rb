class Lodging < ApplicationRecord
  belongs_to :trip
  has_many :days
  
  def assign_days(from:, to:)
    lodging_days = trip.days.where(date: from..to)
    lodging_days.update!(lodging_id: id)
  end
end
