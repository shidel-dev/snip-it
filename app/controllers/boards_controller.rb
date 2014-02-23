class BoardsController < ApplicationController
  def index
    redirect _to :root unless current_user
    @user = User.find(session[:id])
    @boards = @user.boards
    @languages = Language.all.order('name')
    @search_title = "Your Boards"
    @snips = []
  end
end