class SnipsController < ApplicationController
  def new
    @snip = Snip.new
    @languages = Language.all
    # @options = Language.all.each_with_index.map{|l,i| ["#{l.name}", i]}
  end

  def create
    puts params
    user = User.find(1)
    user.snips << Snip.create(snip_params)
  end

  private
  def snip_params
    params.require(:snip).permit(:title, :description, :language_id, :content)

  end

end
