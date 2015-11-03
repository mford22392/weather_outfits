class Weather
  attr_accessor :temp, :rain

  def initialize(location)
    @weather_at_location = Barometer.new(location).measure    
    @temp = @weather_at_location.tomorrow.high.f
    
  end

  #['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  def temperature
    if @temp.to_i > 90
      "supa hot"
    elsif @temp.to_i > 80 
      "hot"
    elsif @temp.to_i > 70
      'lil warm'
    elsif @temp.to_i > 60
      'cool'
    elsif @temp.to_i > 40
      'Cold yo'
    else
      'Brrrrr. Freezing'
    end
  end

  #Rain, Snow, Temp methods

end
