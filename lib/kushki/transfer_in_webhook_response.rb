require 'yaml'

class Kushki::TransferInWebhookResponse
  attr_accessor :raw_response

  def initialize raw_response
    @raw_response = JSON.parse(raw_response.body)
  end

  def processor_state
    raw_response.fetch('processorState')
  end

  
  def ticket_number
    raw_response.fetch('ticketNumber')
  end
  
  def bank_id
    raw_response.fetch('bankId')
  end
  
  def trazability_code
    raw_response.fetch('trazabilityCode')
  end
  
  def status
    raw_response['status']
  end

  def payment_description
    raw_response['paymentDescription']
  end

  def token
    raw_response['token']
  end

  def amount
    raw_response['amount']
  end

  def raw
    raw_response.to_yaml
  end
end
