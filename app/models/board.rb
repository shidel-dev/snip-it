class Board < ActiveRecord::Base
  has_many :instances
  has_many :snipits, through: :instances
end
