# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Paginate do
  describe '.construct' do
    it 'returns a pagination string that can be appended to the URL of an API call' do
      expect(described_class.construct(0)).to eq('page[number]=0&')
      expect(described_class.construct(1)).to eq('page[number]=1&')
      expect(described_class.construct(10)).to eq('page[number]=10&')
    end
  end
end
