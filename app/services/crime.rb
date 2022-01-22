class Crime
  attr_reader :month, :category, :outcome

  def initialize(data)
    @category = data[:category]
    @outcome = data[:outcome_status][:category]
    @month = data[:month]
  end
end
