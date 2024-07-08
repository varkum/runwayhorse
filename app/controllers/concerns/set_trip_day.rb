module SetTripDay
  extend ActiveSupport::Concern
  
  included do
    before_action :set_trip
    before_action :set_day, except: :index
  end
  
  private
  
  def set_trip
    @trip = Current.user.trips.find(params[:trip_id])
    
    unless @trip
      @trip_token = params[:id] || params[:trip_id]
      @trip = Trip.find_by_token_for(:sharing, @trip_token)
    end
  end
  
  def set_day
    @day = @trip.days.find(params[:day] || params[:id])
  end
end
