class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    if @board
      render "show"
    else
      redirect_to("/")
    end
  end
end

