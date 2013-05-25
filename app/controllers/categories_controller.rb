class CategoriesController < ApplicationController

  before_filter :load_project
  before_filter :load_category, only: [:edit, :update, :destroy, :move]

  def new
    @category = @project.categories.new parent_id: params[:parent_id]
  end

  def create
    @category = @project.categories.new(params[:category].merge({ project_id: @project.id }))
    if @category.save
      redirect_to edit_project_path(@project, category_id: @category.id), notice: "Successfully created category."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category].merge({ project_id: @project.id }))
      redirect_to edit_project_path(@project, category_id: @category.id), notice: "Successfully updated category."
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

  ##
  # Action called by AJAX when a category changes position.
  def move
    new_position = params[:position] || @category.position
    if @category.move_to new_position
      render text: 'success'
    else
      render text: 'failure'
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
