module Trip::Activeable
  extend ActiveSupport::Concern
  
  included do
    has_one :active_label, dependent: :destroy
  end
  
  def current_day
    active_day = days.find_by(date: Date.today)
    active_day || days.first
  end
end
