# frozen_string_literal: true

class WritingController < ApplicationController
  def index
    @page_title = "Writing | Josh Vince"
    @heading = "Writing"
    @page_subtitle = "All of this is true except the parts I made up"
    @posts = BlogPost.order(published_on: :desc).all
  end

  def blog_post
    @blog_post = BlogPost.find_by(slug: params[:slug]) or not_found
    @page_title = @blog_post.title

    @markdown_content = @blog_post.html_content(BlogPostTailwindRenderer)
  end

  def the_bit
    @page_title = "The Bit | Josh Vince"
    render "the_bit/the_bit", layout: false
  end
end
