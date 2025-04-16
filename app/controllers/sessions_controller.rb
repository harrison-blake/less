class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(email: params[:email])

    if user
      session[:user_id] = user.id
      user.increment!(:total_logins)
      user.update_column(:last_logged_in_at, Time.current)

      redirect_to dashboard_path, notice: "Logged in as #{user.name}"
    else
      flash.now[:alert] = "something is wrong bro"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out"
  end
end
