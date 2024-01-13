# frozen_string_literal: true

class InfoController < ApplicationController
  def home
    @page_title = "Josh Vince"
    @highlighted_blog_posts = BlogPost.order(published_on: :desc).limit(5)
  end

  def me
    @page_title = "About me | Josh Vince"
  end

  def contact
    @page_title = "Contact me | Josh Vince"
  end
end
