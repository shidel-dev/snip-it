class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect_to '/'
    else
      # return login error?
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
