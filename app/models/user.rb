require 'bcrypt'

class User < ActiveRecord::Base
  has_many :boards
  has_many :snips
  include BCrypt
  has_secure_password
end
