# Payrix Ruby Library

![Test](https://github.com/HiMamaInc/payrix/actions/workflows/test.yml/badge.svg)

A Ruby SDK for communicating with the [Payrix API](https://test-portal.payrix.com/docs/api).

The implementation and interface of this library takes inspiration from the
[Stripe Ruby client](https://github.com/stripe/stripe-ruby). Some features of this library include:

- Easy configuration (with optional thread-safe configuration)
- Helpers to assist with pagination
- Built-in bi-directional translation between camel-case and snake-case fields

This library follows [Semantic Versioning](https://semver.org/).

## Installation

### Supported Ruby Versions

- 2.7 (deprecated)
- 3.0
- 3.1
- 3.2

### Requirements

- Faraday (`~> 2.0.1`)

### Bundler

This library can be installed from a `Gemfile` using Bundler.

```ruby
gem 'payrix', git: 'https://github.com/HiMamaInc/payrix.git'
```

## Usage

### Quickstart

Configure the library using your API key to start making requests.

```ruby
require 'bundler/setup'
require 'payrix'

Payrix.api_key = '928b...'
Payrix.region = :us

# Retrieve a single transaction
Payrix::Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da')

# List merchants
Payrix::Merchant.list
```

### Retrieve

Retrieve a single resource by ID.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849')

merchant.id # => "t1_mer_620acd189522582b3fb7849"
merchant.status # => 2
```

### List

Retrieve a collection of resources.

```ruby
merchants = Payrix::Merchant.list

merchants.each do |merchant|
  merchant.id # => "t1_mer_..."
end
```

#### Filtering

Filter through the returned results by passing an argument to `.list`.

```ruby
merchants = Payrix::Merchants.list({ status: Payrix::Merchant::STATUS_BOARDED })
```

This will apply the **equals** operator by default. To apply other more dynamic filters, use the
`Payrix::Search` module.

```ruby
filter = Payrix::Search.less(:status, Payrix::Merchant::STATUS_BOARDED)
merchants = Payrix::Merchants.list(filter)
```

Here is a list of all simple operators available.

- `Payrix::Search.equals`
- `Payrix::Search.greater`
- `Payrix::Search.less`

The interface of all operators follows `.operator(:field, value)`.

Use compound operators to make combinations of simple and other compound operators.

```ruby
filter =
  Payrix::Search.or(
    Payrix::Search.equals(:status, Payrix::Merchant::STATUS_BOARDED),
    Payrix::Search.equals(:status, Payrix::Merchant::STATUS_READY),
  )

merchants = Payrix::Merchants.list(filter)
```

The available compound operators are `Payrix::Search.or` and `Payrix::Search.and`. Both operators
takes 2+ simple or compound search nodes.

#### Paginating

Payrix supports pagination for paging through a collection of resources. By default, the initial
`.list` call requests the first page of resources, and returns an object to page through more.

```ruby
ids = []
merchants = Payrix::Merchant.list

ids += merchants.map { |merchant| merchant.id }

while merchants.more?
  merchants.page_forward

  ids += merchants.map { |merchant| merchant.id }
end
```

Use the manual approach above, or use a library helper to make this easier.

```ruby
ids = Payrix::Merchant.list.auto_paging_map { |merchant| merchant.id }
```

There are a few other helpers.

- `#auto_paging_each` - Pass in a `&block` to execute some code for each resource.
- `#auto_paging_count` - Return a count of all resources in the collection.

Use the `:page` and `:limit` parameter to skip to a certain page and limit the results returned.

```ruby
Payrix::Merchant.list({}, { page: 2, limit: 10 })
```

### Create

Create a single resource.

```ruby
txn = Payrix::Txn.create({
  type: Payrix::Txn::TYPE_SALE_TRANSACTION,
  origin: Payrix::Txn::ORIGIN_COMMERCE_SYSTEM,
  merchant: 't1_mer_620acd189522582b3fb7849',
  total: 12500,
  token: '05885cff7ac5be8748390a44c43b6f85',
  cof_type: Payrix::Txn::COF_TYPE_SINGLE,
})

txn.id # => "t1_txn_64026b07cc6a79dd5cfd0da"
```

### Update

Update a single resource.

```ruby
customer = Payrix::Customer.update('t1_cus_64d511636b66052bb4dec9c', { first: 'Joy' })

customer.id # => "t1_cus_64d511636b66052bb4dec9c"
customer.first # => "Joy"
```

### Delete

Delete a single resource by ID.

```ruby
Payrix::Merchant.delete('t1_mer_620acd189522582b3fb7849')
```

This operation is idempotent. Multiple calls using the same ID will not raise an error. The first time this is called, the resource will be returned from this operation. Subsequent calls will return `nil`.

### Options

All requests accept an options hash parameter.

- `.retrieve(id, options)`
- `.list(filters, options)`
- `.delete(id, options)`
- `.create(data, options)`
- `.update(id, data, options)`

You can use this to access more functionality described below.

#### Expanding

Pass in `:expand` to retrieve associated data in the same API call.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { expand: ['entity'] })

merchant.entity.id # => "t1_ent_620acd189522582b3fb7848"
```

Use dot notation to expand nested resources.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { expand: ['entity.org_entities'] })

merchant.entity.id # => "t1_ent_620acd189522582b3fb7848"
merchant.entity.org_entities[0].id # => "t1_oet_620acd189522582b3fb78b8"
```

To expand nested resources on an array, add a `[]` before the nested resource.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { expand: ['entity.org_entities[].org'] })

merchant.entity.id # => "t1_ent_620acd189522582b3fb7848"
merchant.entity.org_entities[0].id # => "t1_oet_620acd189522582b3fb78b8"
merchant.entity.org_entities[0].org.id # => "t1_org_620acd189522582b3fb78b8"
```

Pass multiple strings to expand over multiple nested resources.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { expand: ['entity', 'members'] })

merchant.entity.id # => "t1_ent_620acd189522582b3fb7848"
merchant.members # => [...}
```

#### Per Request Configuration

Set the following configuration parameters per request.

- `:api_key` - Set the API key used.
- `:region` - Set the API used (see valid values in Configuration below).
- `:environment` - Set the environment used (see valid values in Configuration below).

```ruby
Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { api_key: 'b442...', region: :ca, environment: :production })
```

This is useful if you need to configure the request in a thread-safe way. This is not possible using the static configuration mentioned in Configuration below. The per-request configuration always takes precedent.

### Errors

All Payrix-specific errors inherit from `Payrix::ApiError`.

- `Payrix::RateLimitError` - The Payrix API initiated a block on subsequent requests.
- `Payrix::AuthenticationError` - The supplied authentication parameters were invalid.
- `Payrix::NotFoundError` - The Payrix API returned an empty response (`.retrieve` only).
- `Payrix::ApiError` - The Payrix API returned a general error.
- `Payrix::NotSupportedError` - The library does not support the given action for the resource.

When a `Payrix::ApiError` is raised, there are often multiple error messages that provide useful information.

```ruby
begin
  Payrix::Txn.create({ ... })
rescue Payrix::ApiError => error
  error.errors # => [...]
end
```

### Configuration

There are a few configuration parameters.

- `Payrix.api_key=` - Use this to set the API key.
- `Payrix.region=` - Use this to set the appropriate API. Set to `:us` or `:ca`.
- `Payrix.environment=` - Use this to set the request environment. Set to `:sandbox` or `:production`.

## Development

After checking out the repository ..

- Install dependencies (`bin/setup`)
- Run tests (`bundle exec rspec`)
- Run linting (`bundle exec rubocop`)
- Run an interactive prompt to experiment (`bin/console`)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HiMamaInc/payrix.

This project is intended to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the attached Apache 2.0 license.

## Code of Conduct

Anyone interacting with this codebase on GitHub, issue trackers, chat rooms, and mailing lists is expected
to follow the [code of conduct]().
