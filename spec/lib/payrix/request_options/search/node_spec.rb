# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Node do
  describe '#construct' do
    it 'raises NotImplementError' do
      expect { described_class.new.construct }.to raise_error(NotImplementedError)
    end
  end
end
