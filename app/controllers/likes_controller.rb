class LikesController < ApplicationController

  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @article.likes.create(model_id: current_model.id)
    end
    redirect_to article_path(@article)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to article_path(@article)
  end

  def find_like
    @like = @article.likes.find(params[:article_id])
  end

  private
  def already_liked?
    Like.where(model_id: current_model.id, id:
      params[:id]).exists?
  end

  private
  def find_article
    @article = Article.find(params[:article_id])
  end


end
