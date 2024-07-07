module SetTripDayHappening
  extend ActiveSupport::Concern
  
  included do
    before_action :set_trip
    before_action :set_day, except: :index
    before_action :set_happening, only: %i[ edit update destroy ]
  end
  
  private
  
  def set_trip
    @trip = Current.user.trips.find(params[:trip_id])
  end
  
  def set_day
    @day = @trip.days.find_by(id: params[:day])
  end
  
  def set_happening
    @happening = @trip.happenings.find(params[:id])
  end
end
