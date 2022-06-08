RSpec.describe Payrix::Resource::Mixin::AttrCasters do
  Payrix::Resource::Tests = Class.new(Payrix::Resource::Base) do
    include Payrix::Resource::Mixin::AttrCasters

    def initialize(params)
      super(params, [:status])

      @resource_name = 'test'
    end

    attr_accessor :status
    attr_cast_to_integer :status
  end

  let(:resource) { Payrix::Resource::Tests.new(status: '1') }

  it 'casts the specified `attribute` as integer' do
    expect(resource.status).to eq 1
  end

  it 'exposes additional method, #`attribute`_raw_value, which returns the value pre-casting' do
    expect(resource.status_raw_value).to eq '1'
  end
end
