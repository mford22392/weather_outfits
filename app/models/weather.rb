class Weather
  attr_accessor :temp, :rain, :condition

  def initialize(location)

    @weather_at_location = Barometer.new(location).measure

    #Current day temperature    
    @temp = @weather_at_location.today.high.f
    @condition = @weather_at_location.responses.first.forecast.first.icon
  end

  #['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  def temperature
    if @temp.to_i > 90
      "super hot"
    elsif @temp.to_i > 80 
      "hot"
    elsif @temp.to_i > 70
      'warm'
    elsif @temp.to_i > 60
      'cool'
    elsif @temp.to_i > 40
      'cold'
    else
      'freezing'
    end
  end

  #RAIN_KEYWORDS = ['Drizzle', 'Rain', 'Spray', 'Showers', 'Thunderstorm', 'Thunderstorms', 'Squalls']
  RAIN_KEYWORDS = ['chancerain', 'chancetstorms', 'rain', 'tstorms']

  def is_raining?
    rain_check = RAIN_KEYWORDS.any?{|word| word == @condition}
    # rain_check = @condition.split(' ').select do |condition|
    #   RAIN_KEYWORDS.any?{|word| condition}
    # end
    !!rain_check
  end


end
