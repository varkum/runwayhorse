json.extract! trip, :id, :name, :start, :end, :created_at, :updated_at
json.url trip_url(trip, format: :json)
