class Day < ApplicationRecord
  belongs_to :trip
  has_and_belongs_to_many :lodgings
  has_many :happenings, -> { order(time: :asc) }, dependent: :destroy

  def previous
    trip.days.find_by(date: date - 1)
  end

  def next
    trip.days.find_by(date: date + 1)
  end
  
  def night_lodging
    if lodgings.count == 1
      lodging = lodgings.first
      lodging unless lodging.end_date == date
    else
      lodgings.select { |lodging| lodging.start_date == date }.pop
    end
  end
end
