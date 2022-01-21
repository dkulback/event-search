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
    user = User.create(user_params)
    if user.save!
      flash[:success] = "Welcome #{user.login}!"
      redirect_to user_path(user)
    else
      flash[:failure] = 'Please input corrected fields'
      render 'new'
    end
  end

  def login_form; end

  def login
    user = User.find_by(login: params[:login])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.login}!"
      redirect_to user_path(user)
    else
      flash[:error] = 'invalid password or username'
      render :login_form
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :password, :email)
  end
end
