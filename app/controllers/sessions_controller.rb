class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        log_in(user)
        redirect_to root_url
    else
      flash.now.alert = "Sorry, that's an invalid email/password combination!"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
