class BibleSearch
  def initialize(search)
    @search = search
  end
  def find_passage
    Passage.new(get_url(@search))
  end
  def get_url(url)
     response = HTTParty.get("https://bible-api.com/#{url}?translation=kjv")
     JSON.parse(response.body, symbolize_names: true)
  end
end
