class SnipsController < ApplicationController
  def index
    redirect _to :root unless current_user
    @user = User.find(session[:id])
    @snips = @user.snips
    @languages = Language.all.order('name')
    @search_title = "Your Snipits"
    @boards = Board.where('user_id = ?', session[:id])
  end

  def new
    @snip = Snip.new
    @languages = Language.all
    @boards = Board.where('user_id = ?', session[:id])
  end

  def create
    puts params
    user = User.find(1)
    user.snips << Snip.create(snip_params)
  end

  private
  def snip_params
    params.require(:snip).permit(:title, :description, :language_id, :content)
  end

end
