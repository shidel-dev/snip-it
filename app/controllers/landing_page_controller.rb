class LandingPageController < ApplicationController
  def index
    @user = session[:id]
    @languages = Language.all.shuffle[0..8]
  end
end
