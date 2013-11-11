class AddCategoriesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :categories, :string
  end
end
