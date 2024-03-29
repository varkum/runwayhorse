class LodgingsController < ApplicationController
  before_action :set_trip
  
  def index
    @lodgings = @trip.lodgings
  end
  
  def new
    @lodging = Lodging.new
  end
  
  def create
    
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private 
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def lodging_params
    params.require(:lodging)
  end
end
