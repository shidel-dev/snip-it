class SnipitsController < ApplicationController
  def index
    redirect _to :root unless current_user
    @user = User.find(params[:user_id])
    @snipits = @user.snipits
  end

  def new_snipit
    @options = Language.all.each_with_index.map{|l,i| ["#{l.name}", i]}
  end

  def create
    snipit = current_user.snipits.new(create_params)
    #what is current user?

    if quote.save
      redirect to
    else
      render :new_snipit
    end
  end

  private

  def create_params
    params.require(:quote).permit(:user_id, :language_id, :title, :description, :content)
  end

end
