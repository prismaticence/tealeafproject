class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
  	@posts = Post.all
  end

  def show
  	@comment = Comment.new

  end

  def new
  	@post = Post.new

  end

  def create
  	@post = Post.new(myparams)
  	@post.creator = User.first

  	if @post.save
  		flash[:success] = "You have saved successfully!"
  		redirect_to posts_path
  	else
  		
     	render 'new'
  	end

  end

  def edit

  end

  def update

	  	
  	@post.update(myparams)

  	if @post.save
  		flash[:success] = "You have updated successfully!"
  		redirect_to post_path(@post)
  	else
  		render 'edit'
  	end
  end

  private
  def myparams
  	params.require(:post).permit(:title, :description, :url, category_ids:[])
  end

  def set_post
  	@post = Post.find(params[:id])
  end

end
