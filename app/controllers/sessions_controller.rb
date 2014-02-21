class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to '/'
    else
      # return login error?
      render '/'
    end
  end

  def new
  end
end
