class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(allow_params)
		if @article.save
			redirect_to article_path(@article)
		else
			render new_article_path
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(allow_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])

	end

	def edit
		@article = Article.find(params[:id])
	end

	private 
		def allow_params
			params.require(:article).permit(:title, :text)
		end

end
