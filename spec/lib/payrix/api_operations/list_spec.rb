# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::List do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::List
    end

    stub_const('Txn', klass)
  end

  describe '.list' do
    it 'instantiates and returns a Payrix::List object' do
      list_object = instance_double(Payrix::List)

      allow(Payrix::List).to(
        receive(:new)
          .with(
            klass: Txn,
            filters: { status: 0 },
            options: { expand: ['merchant'] },
          )
          .and_return(list_object),
      )

      list = Txn.list({ status: 0 }, { expand: ['merchant'] })

      expect(list).to eq(list_object)
    end
  end
end
