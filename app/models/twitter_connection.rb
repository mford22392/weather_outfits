require 'pry'
class TwitterConnection

  attr_reader :client

  def initialize(user)
    @user = user
    @client = create_client
  end

  def create_client
    keys = YAML.load_file('config/application.yml')
    Twitter::REST::Client.new do |config|
      config.consumer_key = keys['CONSUMER_KEY']
      config.consumer_secret = keys['CONSUMER_SECRET']
      config.access_token = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

end
