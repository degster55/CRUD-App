class ArticlesController < ApplicationController
  def index
    @articles = Article.published.by_creation_date_desc
    # @articles = Article.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @author = Author.create(author_params)
    @article = Article.new(article_params)
    @article.author_id = @author.id

    if @article.save
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end

  def show
    @article = Article.published.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article)
    else 
      render :edit
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to root_path
    else
      redirect_to article_path(@article)
    end
  end

  private 

  def article_params
    params.require(:article).permit(:body, :published, :title)
  end

  def author_params
    params.require(:article).require(:author).permit(:name)
  end
end
