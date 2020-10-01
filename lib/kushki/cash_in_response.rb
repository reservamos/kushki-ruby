require 'yaml'

class Kushki::TransferInResponse
  attr_accessor :raw_response

  def initialize raw_response
    @raw_response = JSON.parse(raw_response.body)
  end

  def ticket_number
    raw_response.fetch('ticketNumber')
  end
  
  def token
    raw_response.fetch('token')
  end

  def status
    raw_response.fetch('status')
  end

  def approved?
    status == 'approvedTransaction'
  end

  def declined?
    status == 'declinedTransaction'
  end

  def raw
    raw_response.to_yaml
  end
end
