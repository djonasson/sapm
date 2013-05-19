class CategoriesController < ApplicationController

  before_filter :load_project
  before_filter :load_category, only: [:edit, :update, :destroy]

  def new
    @category = @project.categories.new parent_id: params[:parent_id]
  end

  def create
    @category = @project.categories.new(params[:category].merge({ project_id: @project.id }))
    if @category.save
      redirect_to edit_project_path(@project), notice: "Successfully created category."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category].merge({ project_id: @project.id }))
      redirect_to edit_project_path(@project), notice: "Successfully updated category."
    else
      render :edit
    end
  end

  def destroy
    redirect_to(edit_project_path(@project), alert: "category not found") and return if @category.nil?
    if @category.destroy
      redirect_to(edit_project_path(@project), notice: "Successfully deleted category")
    else
      redirect_to(edit_project_path(@project), alert: "Categorycouldn't be deleted")
    end
  end

  private

  def load_project
    @project = current_user.projects.find(params[:project_id])
  end

  def load_category
    @category = @project.categories.find(params[:id])
  end

end
