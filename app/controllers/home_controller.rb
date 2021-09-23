require 'net/http'
require 'uri'
require 'json'

class HomeController < ApplicationController
  def index
    ww_key = ENV['WORLD_WEATHER_KEY']
    ww_url = 'http://api.worldweatheronline.com/premium/v1/weather.ashx'
    lat = 30.404251
    lon = -97.849442
    api_variables = {:key => ww_key, :q => "#{lat},#{lon}", :format => 'json', :num_of_days => '5'}
  end

  # GET method for retrieving data from an API using uri variables
  def fetch_from_api(api_url, api_variables)
    api_variables_string = "?"
    api_variables.each_key{|key| api_variables_string += "#{key}=#{api_variables[key]}&"}

    puts api_variables_string
    
    response = Net::HTTP.get_response(URI(api_url + api_variables_string))
    return JSON.parse(response.body)
  end 
end
