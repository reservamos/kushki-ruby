# kushky-ruby

This is a gem for the kushki api for ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kushki-ruby', git: 'https://github.com/reservamos/kushki-ruby', tag: 'v0.1.0'
```

And then execute:

    $ bundle

## Usage

Right now there are only 2 api methods implemented: charge and refund.

To use this gem

```
require 'kushki'

client = Kushki.new YOUR_PRIVATE_MERCHANT_ID

```

### CHARGE:

charge receives charge attributes detailed in https://docs.kushkipagos.com/api-reference/card/charge as parameters.

```
response = client.charge({ token: "1as123klsad123, ... })
```

charge response current supported attributes:

```
  ticket_number
  approval_code
  masked_card_number
  card_holder_name
  card_type
  issuing_bank
  payment_brand
  raw
```

### REFUND

refund receives the ticket_number received from the charge response.

```
response = client.refund "12312313123"
```

refund response current supported attributes:

```
  ticket_number
```

### Error handling

when api returns an error 400, a TransactionError exception is raised.
when api return an error 500, a RequestError exception is raised.
when communication to api timeouts or fails, an UnavailableError is raised.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kushki-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
