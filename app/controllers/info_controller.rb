# frozen_string_literal: true

class InfoController < ApplicationController
  def home
    @page_title = "Josh Vince"
    projects = Project.where(standalone: true).to_a
    blog_posts = BlogPost.where(highlight: true).to_a
    @feed_items = (projects + blog_posts).sort_by { |item| item.published_on || Date.new(2000, 1, 1) }.reverse
  end

  def me
    @page_title = "About me | Josh Vince"
  end

  def contact
    @page_title = "Contact me | Josh Vince"
  end
end
