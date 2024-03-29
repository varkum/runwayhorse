class Trip < ApplicationRecord
  belongs_to :user
  
  has_many :days, dependent: :destroy
  has_many :happenings, dependent: :destroy
  has_many :lodgings, through: :days
  
  delegate :transportations, :activities, to: :happenings
  
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
