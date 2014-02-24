class Snip < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :instances
  belongs_to :language

  validates :title, :description, :content, :language_id, :presence => true
 	validates :language_id, numericality: { only_integer: true, message: "Must be Chosen" }


  pg_search_scope :search_title_and_content, :against => [:title,:content,:description]
end

