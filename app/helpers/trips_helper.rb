module TripsHelper
  def setup_or_show(trip)
    return new_trip_path if trip.days.empty?
    trip_path(trip)
  end
end
