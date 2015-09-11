class AddTagListToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tag_list, :string
  end
end
