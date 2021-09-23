require 'net/http'

class HomeController < ApplicationController
  def index
    ww_key = ENV['WORLD_WEATHER_KEY']

    api_variables = {"key" => ww_key, "q" => "London", "format" => "json", "num_of_days" => "5"}
    get_data("http://api.worldweatheronline.com/premium/weather.ashx", api_variables)
  end

  # GET method for retrieving data from an API using uri variables
  def fetch_data(api_url, api_variables)
    api_variables_string = ""
    api_variables.each_key{|key| api_variables_string += "#{key}=#{api_variables[key]}&"}
    uri = "#{api_url}?#{api_variables_string}"
    
    puts uri
  end 
end
