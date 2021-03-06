class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @visited_articles = VisitedArticle.where(:user_id => @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully added account"
      redirect_to @user
    else
      flash[:error] = "Error adding account"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
