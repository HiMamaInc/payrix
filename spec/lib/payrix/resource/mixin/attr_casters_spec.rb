RSpec.describe Payrix::Resource::Mixin::AttrCasters do
  Payrix::Resource::Tests = Class.new(Payrix::Resource::Base) do
    include Payrix::Resource::Mixin::AttrCasters

    def initialize(params)
      super(params, [:status, :amount])

      @resource_name = 'test'
    end

    attr_accessor :status, :amount
    attr_cast_to_integer :status, :amount
  end

  let(:resource) { Payrix::Resource::Tests.new(status: '1', amount: '500') }

  it 'casts the specified attributes as integers' do
    expect(resource.status).to eq 1
    expect(resource.amount).to eq 500
  end

  it 'exposes additional methods, #..._raw_value, for all attributes, which returns the value pre-casting' do
    expect(resource.status_raw_value).to eq '1'
    expect(resource.amount_raw_value).to eq '500'
  end
end
