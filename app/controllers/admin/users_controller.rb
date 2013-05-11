module Admin
  class UsersController < AdminController

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
        redirect_to edit_admin_user_path(@user), notice: "Successfully created user."
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update_attributes(params[:user])
        redirect_to edit_admin_user_path(@user), notice: "Successfully updated user."
      else
        render :edit
      end
    end

    def destroy
      redirect_to(admin_users_path, alert: "User not found") and return if @user.nil?
      if @user.destroy
        redirect_to(admin_users_path, notice: "Successfully deleted user")
      else
        redirect_to(admin_users_path, alert: "User couldn't be deleted")
      end
    end


    private

    def load_user
      @user = User.find params[:id]
    end

  end
end
