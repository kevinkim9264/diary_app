class UsersController < ApplicationController
	def new
		@user = User.new
		@title = "Sign up"
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to user_path(@user)
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		#Should redirect to user's diary profile.(diary index page)
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
