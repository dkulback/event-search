class SessionsController < ApplicationController
  def destory
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are now logged out!'
  end

  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    name = auth_hash['info']['name']

    user = User.find_or_create_by(email: email)
    user.update(login: name)
    session[:access_token] = auth_hash['credentials']['token']

    redirect_to user_path(user)
  end
end
