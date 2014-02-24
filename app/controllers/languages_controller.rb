class LanguagesController < ApplicationController
  layout "application"
  def index
    # all code snipits
    @languages = Language.all.order('name')
    language = Language.find_by_code(params[:code])
    @snips = language.snips.all.reverse
    @search_title = "#{language.name} snips"
    @boards = Board.where('user_id = ?', session[:id])
  end

  def show
    # all code snipits for a given language
  end

  def new
    # @language = Language.new
  end

  def create
    # @language = Language.create
  end

end
