class ArticlesController < ApplicationController
	def index
		@articles = Article.all
		@user = User.find(params[:user_id])
	end

	def new
		@article = Article.new
		@user = User.find(params[:user_id])
	end

	def create
		@article = Article.new(allow_params)
		if @article.save
			flash[:notice] = "You have successfully saved."
			redirect_to article_path(@article)
		else
			render new_article_path
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(allow_params)
			flash[:success] = "Successfully Updated!"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
		@user = @article.user_id
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private 
		def allow_params
			params.require(:article).permit(:title, :text)
		end

end
