class Trips::NotesController < ApplicationController
  def show
    @trip = Trip.find(params[:trip_id])
  end
end
