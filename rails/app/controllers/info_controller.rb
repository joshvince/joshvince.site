# frozen_string_literal: true

class InfoController < ApplicationController
  def projects
    render "project_list"
  end
end
