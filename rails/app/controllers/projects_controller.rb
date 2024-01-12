class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(index: :asc)
    @page_title = "Projects"

    render(
      "index",
      locals: {
        projects: @projects,
        title: 'Projects',
        subtitle: 'Some things I\'ve made or places I\'ve worked'
      }
    )
  end

  def jobs
    @projects = Project.where(job: true).order(index: :asc)
    @page_title = "Jobs"

    render(
      "index",
      locals: {
        projects: @projects,
        title: 'Jobs',
        subtitle: 'Places I have worked'
      }
    )
  end

  def side_projects
    @projects = Project.where(job: false).order(index: :asc)
    @page_title = "Side projects"

    render(
      "index",
      locals: {
        projects: @projects,
        title: 'Projects',
        subtitle: 'Things I\'ve made outside of my job'
      }
    )
  end

  def show
    @project = Project.where(slug: params[:slug]).first
    @page_title = @project.name

    render "show", locals: { project: @project }
  end

  def bit
    @page_title = "The Bit"
    render "bit/bit", layout: false
  end
end
