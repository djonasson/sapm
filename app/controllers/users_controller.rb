class UsersController < ApplicationController

  def index
    @users = User.all
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
      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), notice: "Successfully updated user."
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    redirect_to(users_path, alert: "User not found") and return if user.nil?
    user.destroy
    redirect_to(users_path, notice: "Successfully deleted user")
  end

end
