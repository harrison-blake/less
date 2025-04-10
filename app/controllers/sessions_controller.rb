class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(email: params[:email])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in as #{user.name}"
    else
      flash.now[:alert] = "Invalid email"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out"
  end
end

