class Kushki::TransactionError < StandardError
  attr_reader :code
  def initialize(raw_response)
    response = JSON.parse(raw_response.body)
    @code = response['processorError']
    super(response['message'])
  end
end
