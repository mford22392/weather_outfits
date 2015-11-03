class Weather < ActiveRecord::Base
  attr_accessor :temp, :rain

  def initialize(location)
    
    
  end

  def current_temp
    barometer = Barometer.new(location)
    weather = barometer.measure
    puts weather.current.temperature

  end


  #Rain, Snow, Temp methods



end
