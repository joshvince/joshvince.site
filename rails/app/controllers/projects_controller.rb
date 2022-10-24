class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    render "index", projects: @projects
  end

  def show
    @project = Project.where(slug: params[:id]).first

    render "show", project: @project
  end
end
