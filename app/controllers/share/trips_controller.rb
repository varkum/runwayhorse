class Share::TripsController < ApplicationController
  layout "share"
  skip_before_action :validate_access
  before_action :set_trip
  
  def show
  end
  
  private
  
  def set_trip
    @trip = Trip.find_by_token_for(:sharing, params[:trip])
  end
end
