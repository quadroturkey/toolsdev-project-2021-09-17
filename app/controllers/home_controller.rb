class HomeController < ApplicationController

  def index
    ww_key = ENV['WORLD_WEATHER_KEY']
    ww_url = 'http://api.worldweatheronline.com/premium/v1/weather.ashx'
    lat = 30.404251
    lon = -97.849442
    api_variables = {:key => ww_key, :q => "#{lat},#{lon}", :format => 'json', :num_of_days => '5'}

    # ww_uri = self.build_uri(ww_url, api_variables)
    # data = self.fetch_from_api(ww_uri)

    # response = self.create_new_condition('test')
  end  

end