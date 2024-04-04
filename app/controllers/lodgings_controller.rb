class LodgingsController < ApplicationController
  before_action :set_trip, only: %i[ index new create ]
  before_action :set_day, only: [ :new, :create ]
  before_action :set_lodging, only: %i[ edit update destroy ]
  
  def index
    @lodgings = @trip.lodgings
  end
  
  def new
    @lodging = Lodging.new
  end
  
  def create
    @lodging = Lodging.create!(trip: @trip, name: lodging_params[:name], address: lodging_params[:address], link: lodging_params[:link], notes: lodging_params[:notes])
    @lodging.assign_days(from: lodging_params[:start], to: lodging_params[:end])
    
    redirect_to_origin
  end
  
  def edit
  end
  
  def update
    @lodging.update!(name: lodging_params[:name], address: lodging_params[:address], link: lodging_params[:link], notes: lodging_params[:notes])
    @lodging.assign_days(from: lodging_params[:start], to: lodging_params[:end])
    
    redirect_to_origin
  end
  
  def destroy
    @lodging.destroy!
    
    redirect_to_origin
  end
  
  private 
  
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  
  def set_lodging
    @lodging = Lodging.find(params[:id])
  end
  
  def set_day
    @day = Day.find_by(id: params[:day])
  end
  
  def lodging_params
    params.require(:lodging).permit(:start, :end, :name, :address, :link, :notes)
  end
  
  def redirect_to_origin
    if @day
      redirect_to day_path(@day)
    else
      redirect_to trip_lodgings_path(@trip || @lodging.trip)
    end
  end
end
