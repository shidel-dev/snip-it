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
    @snip = current_user.snips.build(snip_params)
    respond_to do |format|
      if @snip.save
        @redirect = snip_path(@snip)
        format.js
      else
        gon.errors = @snip.errors.as_json(full_messages: true)
        format.js
      end
    end
  end

  def show
    @snips = []
    @snips << Snip.find(params[:id])
    @languages = Language.all
    @boards = Board.all
  end

  private
  def snip_params
    params.require(:snip).permit(:title, :description, :language_id, :content)
  end

end
