class UsersController < ApplicationController

  def signup
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render 'index'
    else
      render 'index'
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end



