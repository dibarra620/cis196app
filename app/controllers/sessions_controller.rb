class SessionsController < ApplicationController
	def create
		auth = request.env["omniauth.auth"]
		@user = User.create_with_omniauth(auth)
		session[:user_id] = @user.id
		flash[:notice] = "Signed in!"
		redirect_to user_path(@user.id)
	end

	def destroy
		session[:user_id] = nil
		current_user = nil
		flash[:notice] = "Signed Out!"
		redirect_to root_url
	end
end
