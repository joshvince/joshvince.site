# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    @page_title = "Blog"
    @posts = BlogPost.order(published_on: :desc).all
  end

  def show
    @blog_post = BlogPost.find_by(slug: params[:slug]) or not_found
    @page_title = @blog_post.title

    @markdown_content = @blog_post.html_content(BlogPostTailwindRenderer)
  end
end
