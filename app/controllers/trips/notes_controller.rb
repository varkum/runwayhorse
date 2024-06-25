class Trips::NotesController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end
end
