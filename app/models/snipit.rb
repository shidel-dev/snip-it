class Snipit < ActiveRecord::Base
  belongs_to :user
  has_many :instances
  has_many :boards, through: :instances
end
