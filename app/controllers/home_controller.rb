class HomeController < ApplicationController
  def index
    ww_key = ENV['WORLD_WEATHER_KEY']

    puts 'Landing Page'
    puts ww_key
  end
end
