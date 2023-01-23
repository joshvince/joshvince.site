class BlogPost < ApplicationRecord
  def html_content(renderer_class)
    Redcarpet::Markdown.new(renderer_class).render(markdown_content).html_safe
  end
end
