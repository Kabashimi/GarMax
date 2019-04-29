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
    puts params
    @article = Article.find(params[:format])
    @comments = @article.comments
    @user = current_user
    if @user.present?
      @visited = VisitedArticle.where(:user_id => @user.id, :article_id => @article.id).first
      unless @visited.present?
        VisitedArticle.create(:user_id => @user.id, :article_id => @article.id)
      end
    end

  end

  def add_comment
    puts params
    comment = Comment.new(
        user_id: current_user.id,
        content: params[:comment][:content],
        article_id: params[:comment][:article_id]
    )
    if comment.save
      flash[:success] = "Dodano komentarz"
    else
      flash[:error] = "Błąd zapisu!"
    end
    redirect_to article_path params[:comment][:article_id], format: params[:comment][:article_id]
  end

  def rate
    puts params
    visited = VisitedArticle.find_by(:user_id => current_user.id, :article_id => params[:article])
    visited.note = params[:rate]
    visited.save
    flash[:success] = "Dodano ocenę"
    redirect_to article_path params[:article], format: params[:article]
  end

  def index
    @articles = Article.all
    @user = current_user
  end

  def delete
  end

  def edit
  end
end
