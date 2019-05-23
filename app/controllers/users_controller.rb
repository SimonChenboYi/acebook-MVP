class UsersController < ApplicationController
  def new
    @user = User.new
    render 'users/new'
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:current_user_id] = @user.id
    redirect_to posts_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
