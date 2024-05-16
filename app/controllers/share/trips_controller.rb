class Share::TripsController < ApplicationController
  before_action :set_trip
  
  def show
  end
  
  private
  
  def set_trip
    @trip = Trip.find_by_token_for(:sharing, params[:trip_token])
  end
end
