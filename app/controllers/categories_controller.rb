class CategoriesController < ApplicationController

  before_filter :load_project
  before_filter :load_category, only: [:edit, :update]

  def new
    @category = @project.categories.new
  end

  def create
    @category = @project.categories.new(params[:category])
    if @category.save
      redirect_to edit_project_path(@project), notice: "Successfully created category."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def load_project
    @project = current_user.projects.find(params[:project_id])
  end

  def load_category
    @category = @project.categories.find(params[:id])
  end

end
