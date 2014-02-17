class Board < ActiveRecord::Base
  has_many :snipits, through: :instances
end
