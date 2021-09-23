require 'net/http'
require 'json'
require 'uri'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def build_uri(api_url, variables)
    variable_str = ''
    variables.each_key {|key| variable_str += "#{key}=#{variables[key]}&"}
    return URI("#{api_url}?#{variable_str}")
  end

  # Fetch data from an API using uri variables
  def fetch_from_api(uri)    
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end 
end
