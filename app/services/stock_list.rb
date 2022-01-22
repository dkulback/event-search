class StockList
  def stock_list
    service.stocks.map do |data|
      Stock.new(data)
    end
  end

  def service
    StockService.new
  end
end
