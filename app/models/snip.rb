class Snip < ActiveRecord::Base
  belongs_to :user
  has_many :instances
  validates :user_id, :presence => true
end
