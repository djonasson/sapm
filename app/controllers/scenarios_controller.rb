class ScenariosController < ApplicationController

  before_filter :load_project
  before_filter :load_category
  before_filter :load_feature
  before_filter :load_scenario, only: [:show, :edit, :update, :destroy, :move]

  def show
  end

  def new
    @scenario = @feature.scenarios.new
  end

  def create
    @scenario = @feature.scenarios.new(params[:scenario].merge({ feature_id: @feature.id }))
    if @scenario.save
      redirect_to project_category_feature_path(@project, @category, @feature, scenario_id: @scenario.id), notice: "Successfully created scenario."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scenario.update_attributes(params[:scenario].merge({ feature_id: @feature.id }))
      redirect_to project_category_feature_path(@project, @category, @feature, scenario_id: @scenario.id), notice: "Successfully updated scenario."
    else
      render :edit
    end
  end

  # def destroy
  #   redirect_to(project_category_feature_path(@project, @category, @feature), alert: "Scenario not found.") and return if @scenario.nil?
  #   if @scenario.destroy
  #     redirect_to(project_category_feature_path(@project, @category, @feature), notice: "Successfully deleted scenario.")
  #   else
  #     redirect_to(project_category_feature_path(@project, @category, @feature), alert: "Scenario couldn't be deleted.")
  #   end
  # end

  # ##
  # # Action called when a feature changes position (AJAX).
  # def move
  #   if @scenario.move_to_position(params[:position])
  #     render text: 'success'
  #   else
  #     render text: 'failure'
  #   end
  # end


  private

  def load_project
    @project = current_user.projects.find(params[:project_id])
  end

  def load_category
    @category = @project.categories.find(params[:category_id])
  end

  def load_feature
    @feature = @category.features.find(params[:feature_id])
  end

  def load_scenario
    @scenario = @feature.scenarios.find(params[:id])
  end

end
