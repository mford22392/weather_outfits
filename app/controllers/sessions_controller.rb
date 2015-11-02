class SessionsController < ApplicationController
  def new
    #code
  end

  def create
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
