# frozen_string_literal: true

class InfoController < ApplicationController
  def home
    @page_title = "Josh Vince"
    @highlighted_blog_posts = Writing.all.take(5).sort_by(&:published_on).reverse
  end

  def me
    @page_title = "About me | Josh Vince"
  end

  def contact
    @page_title = "Contact me | Josh Vince"
  end
end
