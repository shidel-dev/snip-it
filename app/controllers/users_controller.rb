class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success_sign_up] = "Snipit Account Successfully Created"
      redirect_to new_session_path
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end



