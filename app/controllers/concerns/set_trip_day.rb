module SetTripDay
  extend ActiveSupport::Concern
  
  included do
    before_action :set_trip
    before_action :set_day, except: :index
  end
  
  private
  
  def set_trip
    if signed_in?
      @trip = Current.user.trips.find(params[:trip_id])
    else
      validate_shared_trip_token
    end
  end
  
  def set_day
    @day = @trip.days.find_by(id: params[:day])
  end
end
