class Kushki
  attr_accessor :headers, :base_url

  def initialize private_merchant_id
    @base_url = "https://api-uat.kushkipagos.com"
    @headers = {
      "Private-Merchant-Id": private_merchant_id,
      "Content-Type": "application/json"
    }
  end

  def charge attributes
    kuski_request do
      url = "#{base_url}/card/v1/charges"
      response = post(url, attributes.to_json, headers)
      ChargeResponse.new(response)
    end
  end

  def refund ticket_number
    kuski_request do
      url = "#{base_url}/v1/refund/#{ticket_number}"
      response = delete(url, headers)
      RefundResponse.new(response)
    end
  end

  def kuski_request
    yield
  rescue RestClient::BadRequest => e
    raise TransactionError, e.response
  rescue RestClient::InternalServerError => e
    raise RequestError, e.response
  rescue RestClient::RequestTimeout, RestClient::ServiceUnavailable, RestClient::GatewayTimeout, Errno::ETIMEDOUT
    raise UnavailableError
  end

  private

  def post url, attributes, headers
    RestClient::Request.execute(
      method: :post,
      url: url,
      payload: attributes,
      timeout: nil,
      verify_ssl: false,
      headers: headers
    )
  end

  def delete(url, headers)
    RestClient::Request.execute(
      method: :delete,
      url: url,
      timeout: nil,
      verify_ssl: false,
      headers: headers
    )
  end
end

require 'kushki/charge_response'
require 'kushki/refund_response'
require 'kushki/request_error'
require 'kushki/transaction_error'
require 'kushki/unavailable_error'
require 'rest-client'
require 'json'
