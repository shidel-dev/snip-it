class ResultsController < ApplicationController
  def index
    @snips = Snip.all
  end
end
