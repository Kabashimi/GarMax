class ArticlesController < ApplicationController
  def new
  end

  def show
  end

  def index
    @articles = Article.all
  end

  def delete
  end

  def edit
  end
end
