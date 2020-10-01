class Kushki::CashInStatus
  attr_accessor :params

  def initialize params
    @params = params
  end

  def ticket_number
    params[:ticketNumber]
  end
  
  def token
    params[:token]
  end

  def status
    params[:status]
  end

  def approved?
    status == 'approvedTransaction'
  end

  def declined?
    status == 'declinedTransaction'
  end
end
