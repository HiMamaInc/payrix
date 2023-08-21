# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search do
  describe '.construct' do
    context 'when given nil' do
      it 'raises ArgumentError' do
        expect { described_class.construct(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a number' do
      it 'raises ArgumentError' do
        expect { described_class.construct(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a string' do
      it 'raises ArgumentError' do
        expect { described_class.construct('') }.to raise_error(ArgumentError)
      end
    end

    context 'when given an array' do
      it 'raises ArgumentError' do
        expect { described_class.construct([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when given an empty hash' do
      it 'returns an empty string' do
        filter = described_class.construct({})

        expect(filter).to eq('')
      end
    end

    context 'when given a non-empty hash' do
      it 'returns a search string of chained equals operators' do
        filter = described_class.construct({ status: 2, authorized: 1 })

        expect(filter).to eq('status[equals]=2&authorized[equals]=1')
      end
    end

    context 'when given a search node' do
      it 'returns a search string using the node' do
        node = described_class::Greater.new(:status, 1)
        filter = described_class.construct(node)

        expect(filter).to eq('status[greater]=1')
      end
    end
  end

  describe '.equals' do
    it 'returns an Equals search node instance with the pass in arguments' do
      equals = described_class.equals(:field, 'value')

      expect(equals).to be_a(described_class::Equals)
      expect(equals.field).to eq(:field)
      expect(equals.value).to eq('value')
    end
  end

  describe '.greater' do
    it 'returns a Greater search node instance with the pass in arguments' do
      greater = described_class.greater(:field, 'value')

      expect(greater).to be_a(described_class::Greater)
      expect(greater.field).to eq(:field)
      expect(greater.value).to eq('value')
    end
  end

  describe '.less' do
    it 'returns a Less search node instance with the pass in arguments' do
      less = described_class.less(:field, 'value')

      expect(less).to be_a(described_class::Less)
      expect(less.field).to eq(:field)
      expect(less.value).to eq('value')
    end
  end
end
