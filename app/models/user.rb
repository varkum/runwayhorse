class User < ApplicationRecord
  has_secure_password
  
  has_many :trips
  has_one :active_label
  
  after_create :setup_active_trip
  
  def initials
    name.split(' ').map { |part| part[0].upcase }.join
  end
  
  def active_trip
    active_label.trip
  end
  
  private 
  
  def setup_active_trip
    #create first trip and set active label
  end
end
