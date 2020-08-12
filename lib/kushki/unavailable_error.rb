class Kushki::UnavailableError < StandardError
  attr_reader :code
  def initialize(message)
    @code = 1200
    super(message)
  end
end
