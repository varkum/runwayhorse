class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8 }

  normalizes :email, with: -> email { email.strip.downcase }
  
  has_one :active_label, dependent: :destroy
  has_many :trips, dependent: :destroy
  
  after_create :setup_active_trip
  
  generates_token_for :password_reset, expires_in: 15.minutes

  def initials
    name.split(" ").map { |part| part[0].upcase }.join
  end
  
  def first_name
    name.split(" ").first
  end

  def active_trip
    active_label.trip
  end

  private

  def setup_active_trip
    first_trip = trips.create! name: "Untitled trip"
    create_active_label! trip_id: first_trip.id
  end
end
