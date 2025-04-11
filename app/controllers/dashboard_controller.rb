class DashboardController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
  end

  private

  def require_login
    redirect_to login_path, alert: "Please log in first." unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
