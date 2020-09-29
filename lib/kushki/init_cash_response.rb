require 'yaml'

class Kushki::InitCashResponse
  attr_accessor :raw_response

  def initialize raw_response
    @raw_response = JSON.parse(raw_response.body)
  end

  def ticket_number
    raw_response.fetch('ticketNumber')
  end

  def agreement_number
    raw_response.fetch('agreementNumber')
  end

  def bar_code_url
    raw_response.fetch('barCodeUrl')
  end

  def pin_bar_code  
    raw_response.fetch('getPinBarCode')
  end
  
  def pins
    raw_response['pins']
  end

  def pdf_url
    raw_response['pdfUrl']
  end

  def pin
    raw_response['pin']
  end

  def agreementDetails
    raw_response['agreementDetails']
  end

  def pdf
    raw_response['pdf']
  end

  def transaction_reference
    raw_response['transaction_reference']
  end

  def raw
    raw_response.to_yaml
  end
end
