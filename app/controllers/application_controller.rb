class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::InvalidAuthenticityToken, :with => :error_fill_out_form
  include SessionsHelper

  def error_fill_out_form
  	redirect_to '/outfits/new'
  	
  end


end
