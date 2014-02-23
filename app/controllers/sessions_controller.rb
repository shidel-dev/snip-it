class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to '/'
    else
      flash.now[:login_error] = "Invalid Email/Password Combination"
      # puts "********* #{flash[errors]}"
      render 'new'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
end
