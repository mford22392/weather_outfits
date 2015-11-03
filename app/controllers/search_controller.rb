
class SearchController < ApplicationController

  def index
    @location = params[:location]
    weather = Weather.new(@location)
    #rain

    case weather.temperature
      when 'supa hot'
        @outfit = 'supa hot'
      when "hot"
        @outfit = 'hot'
      when 'lil warm'
        @outfit = 'lil warm'
      when 'cool'
        @outfit = 'cool'
      when 'Cold yo'
        @outfit = 'Cold yo'
      else
        @outfit = 'Brrrrr. Freezing'
      end
  end

end

