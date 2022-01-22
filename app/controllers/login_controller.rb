class LoginController < ApplicationController
  def login_form
    # flash.keep
  end

  def login
    user = User.find_by(login: params[:login])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.login}!"
      redirect_to user_path(user)
    else
      flash[:error] = 'invalid password or username'
      redirect_to login_path

    end
  end
end
