class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save # Article.create(article_params)

    flash.notice = "Article #{@article.title} Created!"

    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path
  end

  def destroy
    @article.delete

    flash.notice = "Article #{@article.title} Deleted!"

    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :tag_list)
    end

    def load_article
      @article = Article.find(params[:id])
    end
end
