class User < ActiveRecord::Base
  has_many :snipits
  has_many :boards
  has_many :connections
end
