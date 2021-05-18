class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "likht", password: "skleroz", except: [:index, :show]
  before_action :authenticate_model!, only: %i[new create edit destroy update]
  ARTICLES_PER_PAGE = 3
  def index
    @page = params.fetch(:page,0).to_i
    @articles = Article.offset(@page*ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_model
    @article.author.username = current_model.username
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end
