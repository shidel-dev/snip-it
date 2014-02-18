class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.belongs_to :snipit
      t.belongs_to :board
      t.timestamps
    end
  end
end
