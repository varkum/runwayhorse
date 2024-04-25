class TransportationsController < ApplicationController
  before_action :set_render_to_happenings
  before_action :set_trip, only: %i[ index new create ]
  before_action :set_day, except: :index
  before_action :set_happening, only: %i[ edit update destroy ]
  before_action :redirect_if_trial_expired
  
  def index
    @happenings = @trip.transportations
  end

  def new
    @happening = Happening.new happeningable: Transportation.new
  end

  def create
    @happening = Happening.record!(Transportation.new(origin: transportation_params[:origin], destination: transportation_params[:destination],
      mode: transportation_params[:mode]),
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
    @trip = Trip.find(params[:trip_id])
  end

  def set_day
    @day = Day.find_by(id: params[:day])
  end

  def set_happening
    @happening = Happening.find(params[:id])
  end

  def transportation_params
    params.require(:happening).permit(:origin, :destination, :date, :mode, :notes, :time)
  end

  def redirect_to_origin(notice: nil)
    if @day
      redirect_to day_path(@day), notice: notice
    else
      redirect_to trip_transportations_path(@trip || @happening.trip), notice: notice
    end
  end
end
