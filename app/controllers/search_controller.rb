
class SearchController < ApplicationController

  def index
    @location = params[:location]
    @weather_at_location = Barometer.new(@location)
  end



end
