# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::UpdateDisabled do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::UpdateDisabled
    end

    stub_const('Txn', klass)
  end

  describe '.Update' do
    it 'raises Payrix::NotSupportedError' do
      expect { Txn.update('t1_txn_64026b07cc6a79dd5cfd0da', {}) }.to(
        raise_error(Payrix::NotSupportedError, 'Txn.update is not supported'),
      )
    end
  end
end
