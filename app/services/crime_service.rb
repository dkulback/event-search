class CrimeService
  def crimes
    get_url('category=all-crime&force=leicestershire')
  end

  def get_url(url)
    response = HTTParty.get("https://data.police.uk/api/crimes-no-location?#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
