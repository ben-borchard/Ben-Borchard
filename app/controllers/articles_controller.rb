class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		if user_is_admin?
			@article = Article.new
		else
			render 'shared/access_denied'
		end
	end

	def edit
		if user_is_admin?
			@article = Article.find(params[:id])
		else
			render 'shared/access_denied'
		end
	end
	
	def create
		if user_is_admin?
			@article = Article.new(article_params)

			if @article.save
				redirect_to @article
			else
				render 'new'
			end
		else
			render 'shared/access_denied'
		end
	end

	def update

		if user_is_admin?
			@article = Article.find(params[:id])

			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
			end
		else
			render 'shared/access_denied'
		end
	end

	def destroy

		if user_is_admin?
			@article = Article.find(params[:id])
			@article.destroy

			redirect_to articles_path
		else
			render 'shared/access_denied'
		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
