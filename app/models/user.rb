class User < ActiveRecord::Base
  has_many :snipits
  has_many :boards
  has_many :connections
  has_secure_password
  validates_presence_of :password, :on => :create
end
