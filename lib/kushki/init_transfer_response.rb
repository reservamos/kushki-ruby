require 'yaml'

class Kushki::InitTransferResponse
  attr_accessor :raw_response

  def initialize raw_response, token
    @raw_response = JSON.parse(raw_response.body)
    @raw_response['token'] = token
  end

  def token
    raw_response['token']
  end

  def redirect_url
    raw_response.fetch('redirectUrl')
  end

  def traceability_code
    raw_response.fetch('trazabilityCode')
  end

  def bank_id
    raw_response.fetch('bank_id')
  end

  def bank_name
    raw_response.fetch('bank_name')
  end

  def ticket_number
    raw_response.fetch('ticketNumber')
  end

  def raw
    raw_response.to_yaml
  end
end
