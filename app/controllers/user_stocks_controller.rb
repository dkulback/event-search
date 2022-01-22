class UserStocksController < ApplicationController
  def index
    @stocks = StockList.new.stock_list
  end
end
