class HappeningablesController < ApplicationController
  include SetTripDay
  
  allow_unauthenticated_access only: :index
  before_action :set_happening, only: %i[ edit update destroy ]
  
  def index
    @happenings = index_happeningables
  end
  
  def new
    @happening = Happening.new happeningable: new_happeningable
  end
  
  def create
    @happening = Happening.record new_happeningable, happening_params, @trip
    
    redirect_to_origin notice: "#{@happening.happeningable.class.name} added successfully"
  end
  
  def edit
  end
  
  def update
    @happening.edit happeningable_params, happening_params, @trip
    
    redirect_to_origin
  end
  
  def destroy
    @happening.destroy!

    redirect_to_origin notice: "#{@happening.happeningable.class.name} deleted successfully"
  end
  
  private
  
  def set_happening
    @happening = @trip.happenings.find(params[:id])
  end
  
  def form_params
    params.fetch(:happening, {}).permit(Happening::FORM_PARAMS.concat(Transportation::FORM_PARAMS, Activity::FORM_PARAMS))
  end
  
  def happening_params
    form_params.extract! *Happening::FORM_PARAMS
  end
  
  def redirect_to_origin(notice: nil)
    if @day
      redirect_to trip_day_path(@trip, @day), notice: notice
    else
      redirect_to trip_transportations_path(@trip), notice: notice
    end
  end
end