class HomeController < ApplicationController
  def index
    WORLD_WEATHER_KEY = ENV.fetch('WORLD_WEATHER_KEY')

    puts 'Landing Page'
    puts WORLD_WEATHER_KEY
  end
end
