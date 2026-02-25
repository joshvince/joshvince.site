class AddHighlightToBlogPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :blog_posts, :highlight, :boolean, default: false, null: false
  end
end
