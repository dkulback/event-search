class UserBibleVersesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:commit] == "Search"
      @passage = BibleSearch.new(params[:search_book] + params[:search_chapter] + ':' + params[:search_verse]).find_passage
      render 'index'
    end
  end

end
