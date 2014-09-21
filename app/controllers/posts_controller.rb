class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]

  def index
  	@posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
  	@comment = Comment.new

  end

  def new
  	@post = Post.new

  end

  def create
  	@post = Post.new(myparams)
  	@post.creator = current_user

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

  def vote
  	if Vote.where(voteable_type: "Post", user_id: current_user.id, voteable_id: params[:id]).empty?

	 	vote = Vote.create(vote: params[:vote], voteable_type: "Post", voteable_id: params[:id], user_id: current_user.id)
	 	if vote.save
	 		flash[:notice] = "Your vote was recorded"
	 		redirect_to :back
	 	else
	 		flash[:error] = "Your vote was not recorded"
	 		redirect_to :back
	 	end
	 else
	 	flash[:notice] = "You have already voted on this"
	 	redirect_to :back
	 end
  end


  private
  def myparams
  	params.require(:post).permit(:title, :description, :url, category_ids:[])
  end

  def set_post
  	@post = Post.find(params[:id])
  end	

   def require_same_user

  	unless current_user == @post.creator
  		flash[:error] = "You can't do that!"
  		redirect_to root_path
  	end
  end

end
