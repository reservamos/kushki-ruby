class Kushki::RefundResponse
  attr_accessor :raw_response

  def initialize raw_response
    @raw_response = JSON.parse(raw_response.body)
  end

  def ticket_number
    raw_response.fetch('ticketNumber')
  end

  def raw
    raw_response.to_yaml
  end
end
