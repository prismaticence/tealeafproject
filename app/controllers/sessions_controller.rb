class SessionsController < ApplicationController
	def new

	end

	def create
	
		user = User.find_by username: (params[:username])
	
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			flash[:success] = "You are now logged in"
			redirect_to posts_path
		else
			flash[:notice] = "Your username or password is wrong"
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've logged out"
		redirect_to root_path
	end
end