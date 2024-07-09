module Trip::Progressable
  extend ActiveSupport::Concern
  
  def in_progress?
    (start_date..end_date).include?(Date.today)
  end
  
  def has_happened?
    Date.today > end_date
  end
end
