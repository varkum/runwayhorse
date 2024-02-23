class Trip < ApplicationRecord
  belongs_to :user
  
  has_many :days, dependent: :destroy
  has_many :happenings, dependent: :destroy
  
  has_many :transportations, through: :happenings, source: :happeningable, source_type: 'Transportation'
  has_many :activities, through: :happenings, source: :happeningable, source_type: 'Activity'
  
  def length
    (end_date - start_date).to_i
  end
  
  def create_and_setup_days
    save
    (0..length).each do |day_number|
      self.days.create(date: start_date + day_number)
    end
  end
end
