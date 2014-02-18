class SnipitsController < ApplicationController
  def new
    render 'new_snipit'
  end

  def create
    user = User.find(session[:user_id])
    if user
      # board = Board.find_by_name(params[:board])
      board = Board.find_or_create_by_name(params[:board])
      board.update(user_id:user.id)
      params[:board_id] = board.id

      snipit  = Snipit.create(
        title: params[:title],
        description: params[:description],
        content: params[:content],
        language: params[:language],
        user_id: user.id)

      board.snipits << snipit
    end
    puts snipit.valid?
    if snipit.valid?
      redirect_to "snipits/" + snipit.id.to_s
    end
  end

  def show
    @snipit = Snipit.find(params[:id])

    if @snipit
      render 'show'
    else
      redirect_to('/')
    end
  end
end








