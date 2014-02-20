class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.valid?
      user.save
      render 'index'
    else
      render 'index'
    end
  end
end



