class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "likht", password: "skleroz", except: [:index, :show]

  before_action :authenticate_model!, only: %i[new create edit destroy update]
  before_action :set_article, only: %i[show edit destroy update]

  ARTICLES_PER_PAGE = 3
  def index
    authorize Article

    @page = params.fetch(:page,0).to_i
    @articles = Article.offset(@page*ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE).ordered.search(params[:query])
  end

  def show
    authorize @article
    @article = Article.find(params[:id])
  end

  def new
    authorize Article
    @article = Article.new
  end

  def create
    authorize @article
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
    authorize @article
    @article = Article.find(params[:id])
  end

  def update
    authorize @article

    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  def destroy
    autorize @article

    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

end
