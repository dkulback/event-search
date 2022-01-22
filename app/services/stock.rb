class Stock
  attr_reader :comments, :sentiment, :score, :stock

  def initialize(data)
    @comments = data[:no_of_comments]
    @sentiment = data[:sentiment]
    @score = data[:sentiment_score]
    @stock = data[:ticker]
  end
end
