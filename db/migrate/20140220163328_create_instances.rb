class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.belongs_to :board
      t.belongs_to :snip
      t.timestamps
    end
  end
end
