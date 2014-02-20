class CreateSnips < ActiveRecord::Migration
  def change
    create_table :snips do |t|
      t.string :title
      t.string :description
      t.references :language
      t.text :content
      t.references :user
      t.references :language
      t.timestamps
    end
  end
end
