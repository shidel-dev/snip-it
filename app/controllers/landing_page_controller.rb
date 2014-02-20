class LandingPageController < ApplicationController
  def index
    @languages = Language.all.shuffle[0..10]
  end
end
