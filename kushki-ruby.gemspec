Gem::Specification.new do |s|
  s.name        = 'kushki-ruby'
  s.version     = '1.0.2'
  s.date        = '2020-08-03'
  s.summary     = "Simple ruby client for kushky payment engine"
  s.authors     = ["Marcel Benitez"]
  s.email       = 'marcel@reservamos.mx'
  s.homepage    = 'https://github.com/reservamos/kushki-ruby'
  s.license       = 'MIT'
  s.files       = [
    "lib/kushki.rb",
    "lib/kushki/charge_response.rb",
    "lib/kushki/refund_response.rb",
    "lib/kushki/init_transfer_response.rb",
    "lib/kushki/init_cash_response.rb",
    "lib/kushki/transfer_status_response.rb",
    "lib/kushki/cash_in_status.rb",
    "lib/kushki/transfer_in_status.rb",
    "lib/kushki/request_error.rb",
    "lib/kushki/transaction_error.rb",
    "lib/kushki/unavailable_error.rb"
  ]
end
