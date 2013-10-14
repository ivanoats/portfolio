class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project was successfully added."
      redirect_to @project
    else
      # we'll get to this in a bit
    end
  end

  def show
    @project = Project.find(params[:id])
  end

end

