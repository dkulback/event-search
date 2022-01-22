class CrimeList
  def crimes
    service.crimes.map do |data|
      Crime.new(data)
    end
  end

  def service
    CrimeService.new
  end
end
