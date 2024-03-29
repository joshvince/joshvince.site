# == Schema Information
#
# Table name: blog_posts
#
#  id               :bigint           not null, primary key
#  slug             :string
#  title            :string
#  published_on     :date
#  subtitle         :string
#  markdown_content :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class BlogPost < ApplicationRecord
  def html_content(renderer_class)
    Redcarpet::Markdown.new(renderer_class).render(markdown_content).html_safe
  end

  def published_date
    published_on.strftime("%d %B %Y")
  end
end
