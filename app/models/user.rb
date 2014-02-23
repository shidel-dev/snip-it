require 'bcrypt'

class User < ActiveRecord::Base
  has_many :boards
  has_many :snips
  include BCrypt
  has_secure_password
  include Gravtastic
  gravtastic

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
