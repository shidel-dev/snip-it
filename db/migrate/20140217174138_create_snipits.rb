class CreateSnipits < ActiveRecord::Migration
  def change
    create_table :snipits do |t|
      t.text :content
      t.string :language
      t.belongs_to :user
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
