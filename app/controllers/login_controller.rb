class LoginController < ApplicationController
  def login_form
    # flash.keep
  end

  def login
    user = User.find_by(login: params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome #{user.login}!"
    else
      redirect_to login_path, flash: { error: 'invalid password or username' }
    end
  end
end
