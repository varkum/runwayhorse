class DaysController < ApplicationController
  before_action :set_day, only: %i[ show edit update ]
  before_action :redirect_if_trial_expired
  
  def show
  end

  def edit
  end

  def update
    @day.update!(day_params)

    redirect_to day_path(@day)
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:homebase, :location, :notes)
  end
end
