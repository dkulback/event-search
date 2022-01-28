class UserUkCrimesController < ApplicationController
  def index
    @crimes = CrimeList.new.crimes
  end
end
