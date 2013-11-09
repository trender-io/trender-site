class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :extract
      t.string :image
      t.timestamp :time
      t.float :rating
      t.string :url

      t.timestamps
    end
  end
end
