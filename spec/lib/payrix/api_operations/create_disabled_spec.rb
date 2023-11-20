# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::CreateDisabled do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::CreateDisabled
    end

    stub_const('Txn', klass)
  end

  describe '.create' do
    it 'raises Payrix::NotSupportedError' do
      expect { Txn.create({}) }.to raise_error(Payrix::NotSupportedError)
    end
  end
end
