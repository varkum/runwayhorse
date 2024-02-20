class TransportationsController < ApplicationController
  before_action :set_trip
  
  def new
    @transportation = Transportation.new
  end
  
  def create
  end
  
  private
  
  def transportation_params
    params.require(:transportation).permit(:date, :mode, :notes, :time).with_defaults(booked: true)
  end
end
