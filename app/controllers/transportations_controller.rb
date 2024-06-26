class TransportationsController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip
  before_action :set_day, except: :index
  before_action :set_happening, only: %i[ edit update destroy ]
  
  def index
    @happenings = @trip.transportations
  end

  def new
    @happening = Happening.new happeningable: Transportation.new
  end

  def create
    @happening = Happening.record!(
      Transportation.new(
        origin: transportation_params[:origin], 
        destination: transportation_params[:destination],
        mode: transportation_params[:mode], 
        arrival: transportation_params[:arrival]
        ),
      trip: @trip,
      date: transportation_params[:date],
      time: transportation_params[:time],
      notes: transportation_params[:notes]
      )

    redirect_to_origin notice: "Transportation added successfully"
  end

  def edit
  end

  def update
    @happening.update_meta_attributes!(transportation_params.slice(:date, :time, :notes)) && @happening.transportation.update!(transportation_params.slice(:origin, :destination, :mode))

    redirect_to_origin
  end

  def destroy
    @happening.destroy!

    redirect_to_origin notice: "Transportation deleted successfully"
  end

  private

  def set_render_to_happenings
    lookup_context.prefixes.prepend "happenings"
  end

  def set_trip
    @trip = Current.user.trips.find(params[:trip_id])
  end

  def set_day
    @day = @trip.days.find_by(id: params[:day])
  end

  def set_happening
    @happening = @trip.happenings.find(params[:id])
  end

  def transportation_params
    params.require(:happening).permit(:origin, :destination, :date, :mode, :notes, :time, :arrival)
  end

  def redirect_to_origin(notice: nil)
    if @day
      redirect_to trip_day_path(@trip, @day), notice: notice
    else
      redirect_to trip_transportations_path(@trip), notice: notice
    end
  end
end
