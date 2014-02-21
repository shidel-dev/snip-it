class LandingPageController < ApplicationController
  def index
    @languages = Language.all.shuffle[0..8]
  end
end
