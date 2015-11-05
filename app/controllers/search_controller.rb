require 'twitter-text'

class SearchController < ApplicationController

include Twitter::Autolink

  def index
    # TWITTER:
    #get Twitter connection
    @client = TwitterConnection.new(current_user).create_client
    #search for OOTD hashtags and format the first 10
    @tweets = @client.search("#ootd").take(10).map {|tweet| auto_link(tweet.text)}

    #WEATHER:
    #retrieve location from search or from user's stored location
    @location = params[:location] || current_user.location.to_s
    #new weather object based on location
    weather = Weather.new(@location)

    #WEATHER ATTRIBUTES
    @condition = weather.is_raining?
    @high_temp = weather.temp
    @low_temp = weather.low_temp

    @gender = params[:gender] || current_user.gender
    
    #retrieve proper outfit based on conditions and gender
    @outfit = Outfit.outfit(current_user, weather.temperature, @condition, @gender)
  end

    
end

