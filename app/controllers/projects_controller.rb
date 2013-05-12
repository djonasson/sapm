class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.page(params[:page])
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

end
