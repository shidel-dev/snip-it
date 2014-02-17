class Instance < ActiveRecord::Base
  belongs_to :board
  belongs_to :snipit
end
