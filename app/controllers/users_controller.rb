class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(userparams)

		if @user.save
			flash[:notice] = "You have successfully registered"
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render "new"
		end			
	end

	def show
		
		@user = User.find_by(params[:id])
	end

	def edit
		@user = User.find_by(params[:id])
	end

	def update
		@user = User.find_by(params[:id])
		@user.update(userparams)

		if @user.save
			flash[:notice] = "Updated successfully!"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end



	private

	def userparams
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end