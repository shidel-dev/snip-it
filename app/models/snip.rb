class Snip < ActiveRecord::Base
  belongs_to :user
  has_many :instances
  has_one :language
  validates :user_id, :language_id, :presence => true
end
