class UsersController < ApplicationController
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

    if @user.update!(user_params.to_h.compact_blank)
      redirect_to profile_path, notice: "Profile updated!"
    else
      flash.now[:alert] = "Please fix the errors below."
      render :edit, status: :unprocessable_entity
    end
  end
end

private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :phone, :city, :state, :zip)
    end
