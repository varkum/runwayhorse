class ActiveLabelsController < ApplicationController
  def update
    trip = Trip.find(params[:trip])
    Current.user.active_label.update! trip: trip
    redirect_to trips_path
  end
end
