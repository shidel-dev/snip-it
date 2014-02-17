class Board < ActiveRecord::Base
  has_many :snipits, through: :instances
  has_many :instances
end
