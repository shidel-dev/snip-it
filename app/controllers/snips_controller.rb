
class SnipsController < ApplicationController
  def new
    @snip = Snip.new
    @options = Language.all.each_with_index.map{|l,i| ["#{l.name}", i]}
  end

  def create
    puts params
    # user = User.find(1)
    snip = Snip.create(snip_params)
    # user.snips << snip
  end

  private
  def snip_params
    params.require(:snip).permit(:title, :description, :language, :content)

  end

end
