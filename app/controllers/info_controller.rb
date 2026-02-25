# frozen_string_literal: true

class InfoController < ApplicationController
  def home
    @page_title = "Josh Vince"
    projects = Project.all.to_a
    blog_posts = BlogPost.where(highlight: true).to_a
    @feed_items = (projects + blog_posts).sort_by(&:published_on).reverse
  end

  def me
    @page_title = "About me | Josh Vince"
  end

  def contact
    @page_title = "Contact me | Josh Vince"
  end
end
