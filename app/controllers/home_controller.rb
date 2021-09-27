class HomeController < ApplicationController

  def index
    ww_key = ENV['WORLD_WEATHER_KEY']
    ww_url = 'http://api.worldweatheronline.com/premium/v1/past-weather.ashx'
    lat = 30.404251
    lon = -97.849442
    today = Time.now
    past = Time.now - 2592000
    api_variables = {:key => ww_key, :q => "#{lat},#{lon}", :format => 'json', :date => today.strftime("%Y-%m-%d")}

    # Initialize Database
    @conditions = Condition.all
    api_variables[:date] = past.strftime("%Y-%m-%d") if @conditions.length <= 0
    api_variables[:enddate] = today.strftime("%Y-%m-%d") if @conditions.length <= 0

    # Get data from World Weather API
    ww_uri = self.build_uri(ww_url, api_variables)
    api_result = self.fetch_from_api(ww_uri)

    # Update Database
    if @conditions.length <= 0
        init_params = []

        api_result['data']['weather'].each{ |weather_date| 
          weather_date['hourly'].each{ |weather_hour|
            weather_hour['date'] = weather_date['date']
            init_params.push(format_params(weather_hour))
          }
        }

        self.backdate_database(init_params)
    end

    # params = format_params(api_result['data']['weather'])

    # # Store data in database
    # response = self.create_new_condition(params)
  end  

  def format_params(params)
    return {
      :date_time => "#{params['date']} #{params['time']}",
      :temp_c => params['tempC'],
      :temp_f => params['tempF'],
      :weather_code => params['weatherCode'],
      :icon => params['weatherIconUrl'][0]['value'],
      :desc => params['weatherDesc'][0]['value'],
      :windspeed_mph => params['windspeedMiles'],
      :windspeed_kmph => params['windspeedKmph'],
      :winddir_degree => params['winddirDegree'],
      :winddir_point => params['winddir16Point'],
      :precip_mm => params['precipMM'],
      :precip_in => params['precipInches'],
      :humidity => params['humidity'],
      :visibility => params['visibility'],
      :visibility_miles => params['visibilityMiles'],
      :pressure => params['pressure'],
      :pressure_in => params['pressureInches'],
      :cloud_cover => params['cloudcover'],
      :feels_like_c => params['FeelsLikeC'],
      :feels_like_f => params['FeelsLikeF'],
      :uv => params['uvIndex']
    }
  end

end