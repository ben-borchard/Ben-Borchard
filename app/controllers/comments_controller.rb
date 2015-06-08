class CommentsController < ApplicationController 

	skip_before_action :require_permissions, only: [:create]

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)

		if logged_in?
			@comment.user_id = current_user.id
			@comment.name = current_user.name
		end
		
		if (@comment.save)
			render :partial => "comments/comment", :locals => {:comment => @comment}
		else
			render :js => 'alert("error saving comment");'
		end
		
	end

	def destroy

		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])

		@comment.destroy
		redirect_to(@article)

	end

	private
		def comment_params
			params.require(:comment).permit(:name, :body)
		end

end
