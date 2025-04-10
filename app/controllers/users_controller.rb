class UsersController < ApplicationController
	def new
		@user = User.new()
	end

	def create
    	@user = User.new(user_params)

    	if @user.save
      		session[:user_id] = @user.id
      		redirect_to root_path, notice: "Welcome, #{@user.name.presence || 'new user'}!"
    	else
      		flash.now[:alert] = "There was a problem with your signup."
      		render :new, status: :unprocessable_entity
    	end
  	end
end

private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end