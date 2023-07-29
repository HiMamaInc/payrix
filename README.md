# Payrix Ruby Library

A Ruby SDK for communicating with the [Payrix API](https://test-portal.payrix.com/docs/api).

The implementation and interface of this library takes inspiration from the [Stripe Ruby client](https://github.com/stripe/stripe-ruby)
and [ActiveRecord](https://github.com/rails/rails/tree/main/activerecord).

## Installation

This library can be installed from a `Gemfile` using Bundler.

```ruby
gem 'payrix', git: 'https://github.com/HiMamaInc/payrix.git'
```

## Usage

### Quickstart

Configure the library using your API key to start making requests.

```ruby
require 'payrix'

Payrix.api_key = '928b...'

# Retrieve a single transaction
Payrix::Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da')

# List merchants
Payrix::Merchant.list
```

### Retrieve

Retrieve a single resource by ID. You can access the properties on the resource use dot notation.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849')

merchant.id # => "t1_mer_620acd189522582b3fb7849"
merchant.status # => 2
```

Pass an `:expand` property into the options hash to retrieve associated data in the same API call.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { expand: ['entity'] })

merchant.entity.id # => "t1_ent_620acd189522582b3fb7848"
```
