class Trip < ApplicationRecord
  belongs_to :user
  
  has_many :days, -> { order(date: :asc) }, dependent: :destroy
  has_many :happenings, dependent: :destroy
  has_many :lodgings
  
  delegate :transportations, :activities, to: :happenings
  
  def length
    (end_date - start_date).to_i
  end
  
  def current_day
    active_day = days.find_by(date: Date.today) if (start_date..end_date).include?(Date.today)
    active_day || days.first
  end
  
  def create_and_setup_days
    save
    (0..length).each do |day_number|
      self.days.create(date: start_date + day_number)
    end
  end
end
