class UsersController < ApplicationController
  def show
    @user = if params[:action] == 'login'
              User.find_by(login: params[:login])
            else
              User.find(params[:id])
            end
  end

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:login] = user[:login].downcase
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      flash[:success] = "Welcome #{new_user.login}!"
      redirect_to user_path(new_user)
    else
      redirect_to new_user_path, flash: { failure: new_user.errors.full_messages }
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :email)
  end
end
