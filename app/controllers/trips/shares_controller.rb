class Trips::SharesController < ApplicationController
  skip_before_action :authenticate, :validate_access
  
  def new
    @trip = Trip.find(params[:trip_id])
    @trip_token = @trip.generate_token_for(:sharing)
  end
  
  def show
  end
  
  private
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
