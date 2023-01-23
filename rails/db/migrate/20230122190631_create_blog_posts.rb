class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :slug
      t.string :title
      t.date :published_on
      t.string :subtitle
      t.text :markdown_content

      t.timestamps
    end
  end
end
