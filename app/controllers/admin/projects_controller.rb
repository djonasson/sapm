class Admin::ProjectsController < ApplicationController
  before_filter :load_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.page(params[:page])
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to edit_admin_project_path(@project), notice: "Successfully created project."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to edit_admin_project_path(@project), notice: "Successfully updated project."
    else
      render :edit
    end
  end

  def destroy
    redirect_to(admin_projects_path, alert: "project not found") and return if @project.nil?
    if @project.destroy
      redirect_to(admin_projects_path, notice: "Successfully deleted project")
    else
      redirect_to(admin_projects_path, alert: "project couldn't be deleted")
    end
  end


  private

  def load_project
    @project = Project.find params[:id]
  end
end
