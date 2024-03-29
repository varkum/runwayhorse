class LodgingsController < ApplicationController
  before_action :set_trip
  
  def index
    @lodgings = @trip.lodgings
  end
  
  def new
    @lodging = Lodging.new
  end
  
  def create
    @lodging = Lodging.create!(name: lodging_params[:name], address: lodging_params[:address], link: lodging_params[:link], notes: lodging_params[:notes])
    @lodging.assign_days(from: lodging_params[:start], to: lodging_params[:end])
    redirect_to trip_lodgings_path
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
    params.require(:lodging).permit(:start, :end, :name, :address, :link, :notes)
  end
end
