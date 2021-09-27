json.extract! tempature, :id, :date, :time, :temp, :high, :low, :created_at, :updated_at
json.url tempature_url(tempature, format: :json)
