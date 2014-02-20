class LandingPageController < ApplicationController
  def index
    @languages = Language.all.order('name')
  end
end
