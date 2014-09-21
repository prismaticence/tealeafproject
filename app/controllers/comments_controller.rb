class CommentsController < ApplicationController
	before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params.require(:comment).permit(:body))
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "Your comment has been saved!"
			redirect_to post_path(@post)
		else
			render "posts/show"
		end
	end

	def vote
	if Vote.where(voteable_type: "Comment", user_id: current_user.id, voteable_id: params[:commentid]).empty?
	
		vote = Vote.create(vote: params[:vote], voteable_type: "Comment", voteable_id: params[:commentid], user_id: current_user.id)

		if vote.save
			flash[:notice] = "Your vote has been registered"
			redirect_to :back
		else
			flash[:error] = "There was an error"
			redirect_to :back
		end
	else
		flash[:error] = "You have already voted on this"
		redirect_to :back
	end

	end

end