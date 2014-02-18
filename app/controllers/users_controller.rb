class UsersController < ApplicationController
  def index

  end

  def show
    if session[:user_id]
      @user = User.find(params[:id].to_i)
      render 'profile'
    else
      redirect_to '/login'
    end
  end

  def list_boards
    @boards = User.find(session[:user_id]).boards
    render "board_list"
  end
end
