class LanguagesController < ApplicationController


  def index
    # all code snipits
    @language = Language.find_by_code(params[:code])
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