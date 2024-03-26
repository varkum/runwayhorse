class User < ApplicationRecord
  has_secure_password
  
  has_many :trips
  
  def initials
    name.split(' ').map { |part| part[0].upcase }.join
  end
  
  def active_trip
    trips.last
  end
end
