class ApplicationController < ActionController::Base
 layout "application"
 layout "landing_page", :only => "landing"
  def landing
    @languages = Language.all.shuffle[0..8]
  end
  protect_from_forgery with: :exception

  def current_user
      @current_user ||= User.find(session[:user_id])
  end

  def search
    @snips = Snip.search_title_and_content(params[:search])
    @languages = Language.all.order('name')
    render "/results/index"
  end
end
