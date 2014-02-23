class ApplicationController < ActionController::Base
 layout "application"
 layout "landing_page", :only => "landing"
  def landing
    @languages = Language.all.shuffle[0..8]
  end
  protect_from_forgery with: :exception

  def current_user
    puts "*********ASFa3rara3sfas: #{session[:id].inspect}"
    @current_user ||= User.find_by_id(session[:id])
  end

  def search
    @snips = Snip.search_title_and_content(params[:search])
    @languages = Language.all.order('name')
    @search_title = "Search Results for: #{params[:search]}"
    @boards = Board.where('user_id = ?', session[:id])
    render "/results/index"
  end

  helper_method :current_user
end
