# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::DeleteDisabled do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::DeleteDisabled
    end

    stub_const('Txn', klass)
  end

  describe '.delete' do
    it 'raises Payrix::NotSupportedError' do
      expect { Txn.delete('t1_txn_64026b07cc6a79dd5cfd0da') }.to(
        raise_error(Payrix::NotSupportedError, 'Txn.delete is not supported'),
      )
    end
  end
end
