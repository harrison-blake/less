class UsersController < ApplicationController
  before_action :require_login

  def new
    @user = User.new()
  end

  def show
    @user = current_user
  end

  def create
      @user = User.new(user_params)

      if @user.save
          session[:user_id] = @user.id
          redirect_to profile_edit_path
      else
          flash.now[:alert] = "There was a problem with your signup."
          render :new, status: :unprocessable_entity
      end
    end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update!(user_params)
      redirect_to profile_path, notice: "Profile updated!"
    else
      flash.now[:alert] = "Please fix the errors below."
      render :edit, status: :unprocessable_entity
    end
  end
end

private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def require_login
      redirect_to login_path unless current_user
    end
