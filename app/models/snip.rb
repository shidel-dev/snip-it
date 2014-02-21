class Snip < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :instances
  has_one :language

  validates :user_id, :language_id, :presence => true


  pg_search_scope :search_title_and_content, :against => [:title,:content,:description]
end

