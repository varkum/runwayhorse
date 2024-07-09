class Trips::NotesController < ApplicationController
  allow_unauthenticated_access only: :show
  
  def show
    @trip = Trip.find(params[:trip_id])
  end
end
