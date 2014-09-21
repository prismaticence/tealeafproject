class CategoriesController < ApplicationController
before_action :require_user, only: [:new, :create]
	def index
		@category = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(catparams)

		if @category.save
			flash[:notice] = "Category created"
			redirect_to root_path
		else
			render 'new'
		end
	end

	
	

	private
	def catparams

		params.require(:category).permit(:name)
	end
end
