class BoardsController < ApplicationController
  def index
    redirect _to :root unless current_user
    @user = User.find(session[:id])
    @boards = @user.boards
    @languages = Language.all.order('name')
    @search_title = "Your Boards"
    @snips = []
  end

  def show
    redirect _to :root unless current_user
    @user = User.find(session[:id])
    @languages = Language.all.order('name')
    @boards = @user.boards
    @board = Board.find(params[:id])
    @search_title = "Snipits in #{@board.title}"
    @snips = @board.instances.map{|instance| instance.snip }.reverse
  end
end