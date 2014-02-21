class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
