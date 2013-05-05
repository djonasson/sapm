class UsersController < ApplicationController

  before_filter :load_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to edit_user_path(@user), notice: "Successfully created user."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), notice: "Successfully updated user."
    else
      render :edit
    end
  end

  def destroy
    redirect_to(users_path, alert: "User not found") and return if @user.nil?
    @user.destroy
    redirect_to(users_path, notice: "Successfully deleted user")
  end


  private

  def load_user
    @user = User.find params[:id]
  end

end
