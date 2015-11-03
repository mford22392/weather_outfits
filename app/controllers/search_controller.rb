
class SearchController < ApplicationController
   #['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  def index
    @location = params[:location]
    weather = Weather.new(@location)
    #rain
    @condition = weather.is_raining?
    case weather.temperature
      when 'super hot'
        @outfit = 'supa hot'
      when "hot"
        @outfit = 'hot'
      when 'warm'
        @outfit = 'lil warm'
      when 'cool'
        @outfit = 'cool'
      when 'cold'
        @outfit = 'Cold yo'
      else
        @outfit = 'Brrrrr. Freezing'
      end
  end

end

