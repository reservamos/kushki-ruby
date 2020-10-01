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
    kushki_request do
      url = "#{base_url}/card/v1/charges"
      response = post(url, attributes.to_json, headers)
      ChargeResponse.new(response)
    end
  end

  def refund ticket_number
    kushki_request do
      url = "#{base_url}/v1/refund/#{ticket_number}"
      response = delete(url, headers)
      RefundResponse.new(response)
    end
  end

  def init_transfer attributes
    kushki_request do
      url = "#{base_url}/transfer/v1/init"
      response = post(url, attributes.to_json, headers)
      InitTransferResponse.new(response, attributes[:token])
    end
  end

  def transfer_status token
    kushki_request do
      url = "#{base_url}/transfer/v1/status/#{token}"
      response = get(url, headers)
      TransferStatusResponse.new(response)
    end
  end

  def init_cash attributes
    kushki_request do
      url = "#{base_url}/cash/v1/charges/init"
      response = post(url, attributes.to_json, headers)
      InitCashResponse.new(response)
    end
  end

  def kushki_request
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

  def delete url, headers
    RestClient::Request.execute(
      method: :delete,
      url: url,
      timeout: nil,
      verify_ssl: false,
      headers: headers
    )
  end

  def get url, headers
    RestClient::Request.execute(
      method: :get,
      url: url,
      timeout: nil,
      verify_ssl: false,
      headers: headers
    )
  end
end

require 'kushki/charge_response'
require 'kushki/refund_response'
require 'kushki/init_transfer_response'
require 'kushki/init_cash_response'
require "kushki/transfer_status_response"
require 'kushki/cash_in_status'
require 'kushki/transfer_in_status'
require 'kushki/request_error'
require 'kushki/transaction_error'
require 'kushki/unavailable_error'
require 'rest-client'
require 'json'
