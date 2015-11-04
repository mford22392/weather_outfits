
class SearchController < ApplicationController
   #['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  def index
    #client = Adapters::TwitterAdapter.new
    @location = params[:location] || current_user.location.to_s
    weather = Weather.new(@location)
    @condition = weather.is_raining?
    @high_temp = weather.temp
    @low_temp = weather.low_temp
    @gender = params[:gender] || current_user.gender
    @outfit = Outfit.outfit(current_user, weather.temperature, @condition, @gender)
    #@tweets = client.track("Pink Floyd")
  end

    # if !@condition 
    #   case weather.temperature
    #     when 'super hot'
    #         @outfit = Outfit.super_hot_outfit(current_user)
    #     when "hot"
    #       @outfit = Outfit.hot_outfit(current_user)
    #     when 'warm'
    #       @outfit = Outfit.warm_outfit(current_user)
    #     when 'cool'
    #       @outfit = Outfit.cool_outfit(current_user)
    #     when 'cold'
    #       @outfit = Outfit.cold_outfit(current_user)
    #     else
    #       @outfit = Outfit.freezing_outfit(current_user)
    #   end
    # else 
    #   case weather.temperature
    #     when 'super hot'
    #         @outfit = Outfit.super_hot_rain_outfit(current_user)
    #     when "hot"
    #       @outfit = Outfit.hot_rain_outfit(current_user)
    #     when 'warm'
    #       @outfit = Outfit.warm_rain_outfit(current_user)
    #     when 'cool'
    #       @outfit = Outfit.cool_rain_outfit(current_user)
    #     when 'cold'
    #       @outfit = Outfit.cold_rain_outfit(current_user)
    #     else
    #       @outfit = Outfit.freezing_rain_outfit(current_user)
    #     end
    #   end
    # end
end

