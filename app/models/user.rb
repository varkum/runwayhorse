class User < ApplicationRecord
  has_secure_password
  
  has_many :trips
  
  def current_trip
    trips.last
  end
end
