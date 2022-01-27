class Passage
  attr_reader :reference, :text
  def initialize(info)
    @reference = info[:reference]
    @text = info[:text]
  end
end
