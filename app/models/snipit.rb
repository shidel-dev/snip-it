class Snipit < ActiveRecord::Base
  belongs_to :user
  has_many :instances
end
