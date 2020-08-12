class Kushki::RequestError < StandardError
  attr_reader :code
  def initialize(raw_response)
    response = JSON.parse(raw_response)
    @code = response['code']
    super(response['message'])
  end
end
