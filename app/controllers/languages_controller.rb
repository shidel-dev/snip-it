class LanguagesController < ApplicationController
  layout "application"
  def index
    # all code snipits
    @languages = Language.all
    @snips = Language.find_by_code(params[:code]).snips.all
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
