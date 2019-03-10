class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    puts params
    if params[:article].present? && params[:article][:title].present? && params[:article][:content].present?
      puts 'DUPA'
      article = Article.new(
          title: params[:article][:title],
          content: params[:article][:content]
      )
      article.save
      flash[:success] = "Dodano artykuł"
    else
      flash[:success] = "Błędne parametry"
    end
    redirect_to root_path
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
