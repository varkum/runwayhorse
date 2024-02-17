class Trip < ApplicationRecord
  belongs_to :user
  
  has_many :days
  
  def length
    (end_date - start_date).to_i
  end
  
  def create_and_setup_days
    save
    length.each do |day_number|
      self.days.create(date: start_date + day_number)
    end
  end
end
