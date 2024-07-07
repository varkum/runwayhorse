class HappeningablesController < ApplicationController
  include SetTripDayHappening
  
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
  
  def happening_params
    params.fetch(:happening, {}).permit(:notes, :time, :date)
  end
  
  def redirect_to_origin(notice: nil)
    if @day
      redirect_to trip_day_path(@trip, @day), notice: notice
    else
      redirect_to trip_transportations_path(@trip), notice: notice
    end
  end
end