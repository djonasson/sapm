class FeaturesController < ApplicationController

  before_filter :load_project
  before_filter :load_category
  before_filter :load_feature, only: [:show, :edit, :update, :destroy, :move]

  def show
  end

  def new
    @feature = @category.features.new
  end

  def create
    @feature = @category.features.new(params[:feature].merge({ category_id: @category.id }))
    if @feature.save
      redirect_to project_category_path(@project, @category, feature_id: @feature.id), notice: "Successfully created feature."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feature.update_attributes(params[:feature].merge({ category_id: @category.id }))
      redirect_to project_category_path(@project, @category, feature_id: @feature.id), notice: "Successfully updated feature."
    else
      render :edit
    end
  end

  def destroy
    redirect_to(project_category_path(@project, @category), alert: "Feature not found.") and return if @feature.nil?
    if @feature.destroy
      redirect_to(project_category_path(@project, @category), notice: "Successfully deleted feature.")
    else
      redirect_to(project_category_path(@project, @category), alert: "Feature couldn't be deleted.")
    end
  end

  ##
  # Action called when a feature changes position (AJAX).
  def move
    if @feature.move_to_position(params[:position])
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
    @category = @project.categories.find(params[:category_id])
  end

  def load_feature
    @feature = @category.features.find(params[:id])
  end

end
