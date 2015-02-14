class ArticlesController < ApplicationController
	before_filter :authenticate, only: [:index, :show]
	before_filter :correct_user, only: [:create, :edit, :delete]
	def index
		@user = User.find(params[:user_id])
		@articles = @user.articles
	end

	def new
		@article = Article.new
		@user = User.find(params[:user_id])
		@article.user = @user	
	end

	def create
		@article = Article.new(allow_params)
		@user = User.find(params[:user_id])
		@article.user = @user
		if @article.save
			flash[:notice] = "Successfully Saved"

			redirect_to article_path(@article)
		else
			render 'new'
			#render new_user_article_path(@user)
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
		
	end

	def edit
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to user_articles_path(@article.user)
	end

	


	private 
		def allow_params
			params.require(:article).permit(:title, :text)
		end

		def authenticate
			deny_access unless signed_in?
		end

		def correct_user
			@article = Article.find(params[:id])
			@user = @article.user
			redirect_to(root_path) unless current_user?(@user)
		end

end
