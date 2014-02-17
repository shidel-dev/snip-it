class SnipitsController < ApplicationController
  def new
    render 'new_snipit'
  end

  def create
    user = User.find(session[:user_id])
    if user
      # board = Board.find_by_name(params[:board])
      # if board
      params[:board_id] = Board.find_or_create_by_name(params[:board]).id
      params.delete(:board)
      snipit  = user.snipits.create(
        title: params[:title],
        description: params[:description],
        content: params[:content],
        language: params[:language],
        board_id: params[:board_id])
    end
    if snipit.valid?
      redirect_to "snipits/" + snipit.id.to_s
    end
  end
end
