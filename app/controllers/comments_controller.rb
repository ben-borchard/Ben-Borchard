class CommentsController < ApplicationController 

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)

		if logged_in?
			@comment.user_id = current_user.id
			@comment.name = current_user.name
		end
		
		@comment.save

		redirect_to article_path(@article)
		
	end

	def destroy

		if user_is_admin?
			@article = Article.find(params[:article_id])
			@comment = @article.comments.find(params[:id])

			@comment.destroy
			redirect_to(@article)
		else
			render 'shared/access_denied'
		end

	end

	private
		def comment_params
			params.require(:comment).permit(:name, :body)
		end

end
