# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    @posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find_by(slug: params[:slug]) or not_found

    @markdown_content = @blog_post.html_content(Redcarpet::Render::HTML)
  end
end
