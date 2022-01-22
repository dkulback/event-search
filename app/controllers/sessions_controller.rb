class SessionsController < ApplicationController
  def destory
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are now logged out!'
  end
end
