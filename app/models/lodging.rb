class Lodging < ApplicationRecord
  belongs_to :trip, touch: true
  has_and_belongs_to_many :days, -> { order(date: :asc) }
  
  after_save :assign_days, if: :saved_changes?
  
  private
  
  def assign_days
    lodging_days = trip.days.where(date: start_date..end_date)
    self.days = lodging_days
  end
end
