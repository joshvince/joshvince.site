class BlogPost < ApplicationRecord
  include Rails.application.routes.url_helpers

  def html_content(renderer_class)
    Redcarpet::Markdown.new(renderer_class).render(markdown_content).html_safe
  end

  def url
    writing_url(id: slug)
  end

  def path
    writing_path(id: slug)
  end

  def slug_path
    "/blog/#{slug}"
  end
end
