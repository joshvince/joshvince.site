# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    @page_title = "Writing"
    @page_subtitle = "Blog posts and maybe some fiction if I ever finish anything"
    @posts = BlogPost.order(published_on: :desc).all
  end

  def show
    @blog_post = BlogPost.find_by(slug: params[:slug]) or not_found
    @page_title = @blog_post.title

    @markdown_content = @blog_post.html_content(BlogPostTailwindRenderer)
  end
end
