RSpec.describe Payrix::Resource::Base do
  Payrix::Resource::Tests = Class.new(Payrix::Resource::Base) do
    def initialize(params)
      super(params, [:status, :amount])

      @resource_name = 'test'
    end
  end

  let(:resource) { Payrix::Resource::Tests.new(status: '1', amount: '500') }

  it 'raises Payrix::Exceptions::ApiError with the message which includes the errors payload' do
    expect { resource.create }
      .to raise_error(Payrix::Exceptions::ApiError)
      .with_message(
        'There are errors in the response, '\
        '[{"code"=>13, "severity"=>4, "msg"=>"No such action and/or resource", "errorCode"=>"invalid_resource"}]',
      )
  end
end
