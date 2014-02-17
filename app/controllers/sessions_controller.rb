class SessionsController < ApplicationController
  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/"+user.id.to_s
    else
      rediect_to '/login'
    end

  end

  def logout
    session.clear
    redirect_to '/login'
  end

  def signup
    user  = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if user
      session[:user_id] = user.id
      redirect_to "/users/"+user.id.to_s
    else
      redirect_to '/login_forms'
    end
  end

  def login_forms
    render 'login'
  end
end
