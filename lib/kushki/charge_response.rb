class Kushki::ChargeResponse
  attr_accessor :raw_response, :details

  def initialize raw_response
    @raw_response = JSON.parse(raw_response.body)
    @details = @raw_response.fetch('details')
  end

  def ticket_number
    raw_response['ticketNumber']
  end

  def approval_code
    details['approvalCode']
  end

  def masked_card_number
    details['maskedCardNumber']
  end

  def card_holder_name
    details['cardHolderName']
  end

  def card_type
    details['cardType']
  end

  def issuing_bank
    details['issuingBank']
  end

  def payment_brand
    details['paymentBrand']
  end

  def raw
    raw_response.to_yaml
  end
end

