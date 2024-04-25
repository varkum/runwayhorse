class Trial < ApplicationRecord
  belongs_to :trip
  
  def end_date
    started_on + 5.days
  end
    
  def ends_tomorrow?
    Date.today + 1 == end_date
  end
  
  def active?
    Date.today <= end_date
  end
end
