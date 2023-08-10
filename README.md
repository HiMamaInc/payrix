# Payrix Ruby Library

A Ruby SDK for communicating with the [Payrix API](https://test-portal.payrix.com/docs/api).

The implementation and interface of this library takes inspiration from the
[Stripe Ruby client](https://github.com/stripe/stripe-ruby). Some features of this library include:

- Easy configuration (with optional thread-safe configuration)
- Helpers to assist with pagination
- Built-in bi-directional translation between camel-case and snake-case fields
- Few runtime dependencies

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

Retrieve a single resource by ID. Access properties on the resource using dot notation.

```ruby
merchant = Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849')

merchant.id # => "t1_mer_620acd189522582b3fb7849"
merchant.status # => 2
```

### List

Retrieve a collection of resources. Iterate through the results using methods like `#each`.

```ruby
merchants = Payrix::Merchant.list

merchants.each do |merchant|
  merchant.id # => "t1_mer_..."
end
```

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

Here is a list of all operators available.

- `Payrix::Search.equals`
- `Payrix::Search.greater`
- `Payrix::Search.less`

The interface of all operators follows `.operator(:field, value)`.

### Create

Coming soon ..

### Update

Coming soon ..

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

You can use this to access more functionality described below.

### Expanding

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

### Per Request Configuration

Pass in `:api_key` to set the API key used per request.

```ruby
Payrix::Merchant.retrieve('t1_mer_620acd189522582b3fb7849', { api_key: 'b442...' })
```

This is useful if you need to set the API key in a thread-safe way, which is not possible through
`Payrix.api_key=`. If both are set, the per request configuration takes precedent.

### Errors

Coming soon ..

### Integration

Constants ..
Coming soon ..

### Testing

Coming soon ..

### Contributing

Coming soon ..
