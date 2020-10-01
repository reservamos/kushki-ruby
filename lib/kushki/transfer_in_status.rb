class Kushki::TransferInStatus
  attr_accessor :params

  def initialize params
    @params = params
  end

  def ticket_number
    params[:ticketNumber]
  end
  
  def bank_id
    params[:bankId]
  end
  
  def traceability_code
    params[:trazabilityCode]
  end

  def processor_state
    params[:processorState]
  end
  
  def status
    params[:status]
  end

  def payment_description
    params[:paymentDescription]
  end

  def token
    params[:token]
  end

  def amount
    params[:amount]
  end

  def pending?
    processor_state == 'PENDING'
  end

  def ok?
    processor_state == 'OK'
  end

  def not_authorized?
    processor_state == 'NOT_AUTHORIZED'
  end

  def failed?
    processor_state == 'FAILED'
  end
end