class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to root_path
  end

  def show; end
end

private

def user_params
  params.require(:user).permit(:login, :password, :email)
end
