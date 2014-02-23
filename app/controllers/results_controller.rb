class ResultsController < ApplicationController
  def index
    @snips = Snip.all
    @languages = Language.all.order('name')
    @boards = Board.where('user_id = ?', session[:id])
  end
end
