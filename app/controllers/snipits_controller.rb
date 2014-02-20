class SnipitsController < ApplicationController
  def new_snipit
    @options = Language.all.each_with_index.map{|l,i| ["#{l.name}", i]}
  end
end
