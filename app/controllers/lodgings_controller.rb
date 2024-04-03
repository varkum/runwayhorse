class LodgingsController < ApplicationController
  before_action :set_trip, only: %i[ index new create ]
  before_action :set_lodging, only: %i[ edit update destroy ]
  
  def index
    @lodgings = @trip.lodgings
  end
  
  def new
    @lodging = Lodging.new
    @form_url = trip_lodgings_path(@trip, from: params[:from])
  end
  
  def create
    @lodging = Lodging.create!(trip: @trip, name: lodging_params[:name], address: lodging_params[:address], link: lodging_params[:link], notes: lodging_params[:notes])
    @lodging.assign_days(from: lodging_params[:start], to: lodging_params[:end])
    
    if params[:from] == "lodgings"
      redirect_to trip_lodgings_path(@trip)
    else
      redirect_to day_path(params[:from])
    end
  end
  
  def edit
    @form_url = lodging_path(@lodging, return_to: params[:return_to])
  end
  
  def update
    @lodging.update!(name: lodging_params[:name], address: lodging_params[:address], link: lodging_params[:link], notes: lodging_params[:notes])
    @lodging.assign_days(from: lodging_params[:start], to: lodging_params[:end])
    redirect_to params[:return_to]
  end
  
  def destroy
    @lodging.destroy!
    
    redirect_back_or_to trip_lodgings_path(@lodging.trip), notice: "Lodging deleted"
  end
  
  private 
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def set_lodging
    @lodging = Lodging.find(params[:id])
  end
  
  def lodging_params
    params.require(:lodging).permit(:start, :end, :name, :address, :link, :notes)
  end
end
