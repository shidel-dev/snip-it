class Instance < ActiveRecord::Base
  belongs_to :snip
  belongs_to :board

  validates :snip_id, :board_id, :presence => true
end
