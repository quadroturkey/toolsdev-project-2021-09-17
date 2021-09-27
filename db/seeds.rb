# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# backfill 1 month of data

temps = RestClient.get 'http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=c03bc70bd88145c9abc191601212009&q=30.404251,-97.849442&format=json&date=2021-09-01&enddate=2021-09-22&tp=1'
temps_array = JSON.parse(temps)["data"]["weather"]

temps_array.each do |x|
  x.each do |key, value|
    if key == "date"
      $date = value
    elsif key == "maxtempF"
      $highTemp = value
    elsif key == "mintempF"
      $lowTemp = value
    elsif key == "hourly"
      value.each do |hour|
        temp = hour["tempF"]
        time = hour["time"]
        Tempature.create(
          date: $date,
          time: time,
          temp: temp,
          high: $highTemp,
          low: $lowTemp
        )
      end
    end
  end
end