class LodgingsController < ApplicationController
  include SetTripDay

  allow_unauthenticated_access only: :index  
  before_action :set_lodging, only: %i[ edit update destroy ]
  
  def index
    @lodgings = @trip.lodgings
  end

  def new
    @lodging = Lodging.new
  end

  def create
    @lodging = Lodging.create! lodging_params.merge(trip: @trip)
    
    redirect_to_origin notice: "Lodging added successfully"
  end

  def edit
  end

  def update
    @lodging.update! lodging_params

    redirect_to_origin
  end

  def destroy
    @lodging.destroy!

    redirect_to_origin notice: "Lodging deleted successfully"
  end

  private

  def set_lodging
    @lodging = @trip.lodgings.find(params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:start_date, :end_date, :name, :address, :link, :notes)
  end

  def redirect_to_origin(notice: nil)
    if @day
      redirect_to trip_day_path(@trip, @day), notice: notice
    else
      redirect_to trip_lodgings_path(@trip), notice: notice
    end
  end
end
