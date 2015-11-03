
class SearchController < ApplicationController
   #['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  def index
    @location = params[:location]
    weather = Weather.new(@location)
    @condition = weather.is_raining?
    
    if !@condition 
      case weather.temperature
        when 'super hot'
            @outfit = Outfit.super_hot_outfit(current_user)
        when "hot"
          @outfit = Outfit.hot_outfit(current_user)
        when 'warm'
          @outfit = Outfit.warm_outfit(current_user)
        when 'cool'
          @outfit = Outfit.cool_outfit(current_user)
        when 'cold'
          @outfit = Outfit.cold_outfit(current_user)
        else
          @outfit = Outfit.freezing_outfit(current_user)
      end
    else 
      case weather.temperature
        when 'super hot'
            @outfit = Outfit.super_hot_rain_outfit(current_user)
        when "hot"
          @outfit = Outfit.hot_rain_outfit(current_user)
        when 'warm'
          @outfit = Outfit.warm_rain_outfit(current_user)
        when 'cool'
          @outfit = Outfit.cool_rain_outfit(current_user)
        when 'cold'
          @outfit = Outfit.cold_rain_outfit(current_user)
        else
          @outfit = Outfit.freezing_rain_outfit(current_user)
        end
      end
    end
end

