module Adapters 
  class TwitterClient  < ApplicationController

    def connection
      @connection = TwitterConnection.new(current_user).create_client
    end

    def search(keyword)
    	results = connection.query(q: keyword)
    end


  end
end



# client.search("#ootd").take(10).map {|tweet| auto_link(tweet.text)}