class ResultsController < ApplicationController
  def index
    @snips = Snip.all
    @languages = Language.all.order('name')
  end
end
