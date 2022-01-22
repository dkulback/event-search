class StockService
  def stocks
    get_url('reddit')
  end

  def get_url(url)
    response = HTTParty.get("https://dashboard.nbshare.io/api/v1/apps/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
