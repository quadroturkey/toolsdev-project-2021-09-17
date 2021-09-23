class HomeController < ApplicationController

  def index
    ww_key = ENV['WORLD_WEATHER_KEY']
    ww_url = 'http://api.worldweatheronline.com/premium/v1/weather.ashx'
    lat = 30.404251
    lon = -97.849442
    api_variables = {:key => ww_key, :q => "#{lat},#{lon}", :format => 'json', :num_of_days => '5'}

    # # Get data from world weather online
    # ww_uri = self.build_uri(ww_url, api_variables)
    # api_result = self.fetch_from_api(ww_uri)

    # # Store data in database
    # params = format_params(api_result['data']['current_condition'][0])
    # response = self.create_new_condition(params)
  end  

  def format_params(params)
    return {
      :date_time => "#{Date.today.to_s} #{params['observation_time']}",
      :temp_c => params['temp_C'],
      :temp_f => params['temp_F'],
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