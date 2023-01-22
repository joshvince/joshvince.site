# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    @content = markdown.render("This is *bongos*, indeed.").html_safe
  end

  def show

  end
end
