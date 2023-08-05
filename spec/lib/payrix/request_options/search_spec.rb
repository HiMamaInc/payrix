# frozen_string_literal: true

RSpec.describe Payrix::Search do
  describe '.construct' do
    context 'when passing a number argument' do
      it 'raises ArgumentError' do
        expect { described_class.construct(0) }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node'),
        )
      end
    end

    context 'when passing an array argument' do
      it 'raises ArgumentError' do
        expect { described_class.construct([]) }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node'),
        )
      end
    end

    context 'when passing a string argument' do
      it 'raises ArgumentError' do
        expect { described_class.construct('') }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node'),
        )
      end
    end

    context 'when passing an empty hash argument' do
      it 'returns an empty string' do
        expect(described_class.construct({})).to eq('')
      end
    end

    context 'when passing a non-empty hash argument' do
      it 'returns a search string using the equals operator' do
        expect(described_class.construct({ status: 2, authorized: 1 })).to(
          eq('status[equals]=2&authorized[equals]=1&'),
        )
      end
    end

    context 'when passing an instance of Payrix::Search::Node' do
      it 'returns a search string using the node operator' do
        node = described_class.greater(:status, 1)

        expect(described_class.construct(node)).to eq('status[greater]=1&')
      end
    end
  end

  describe '.equals' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(described_class.equals('field', 'value').construct).to eq('field[equals]=value&')
      expect(described_class.equals('field', 0).construct).to eq('field[equals]=0&')
      expect(described_class.equals('field', '').construct).to eq("field[equals]=''&")
      expect(described_class.equals('field', nil).construct).to eq("field[equals]=''&")
      expect(described_class.equals(:field, 'value').construct).to eq('field[equals]=value&')
      expect(described_class.equals(:field, 0).construct).to eq('field[equals]=0&')
      expect(described_class.equals(:field, '').construct).to eq("field[equals]=''&")
      expect(described_class.equals(:field, nil).construct).to eq("field[equals]=''&")
    end
  end

  describe '.greater' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(described_class.greater('field', 'value').construct).to eq('field[greater]=value&')
      expect(described_class.greater('field', 0).construct).to eq('field[greater]=0&')
      expect(described_class.greater('field', '').construct).to eq("field[greater]=''&")
      expect(described_class.greater('field', nil).construct).to eq("field[greater]=''&")
      expect(described_class.greater(:field, 'value').construct).to eq('field[greater]=value&')
      expect(described_class.greater(:field, 0).construct).to eq('field[greater]=0&')
      expect(described_class.greater(:field, '').construct).to eq("field[greater]=''&")
      expect(described_class.greater(:field, nil).construct).to eq("field[greater]=''&")
    end
  end

  describe '.less' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(described_class.less('field', 'value').construct).to eq('field[less]=value&')
      expect(described_class.less('field', 0).construct).to eq('field[less]=0&')
      expect(described_class.less('field', '').construct).to eq("field[less]=''&")
      expect(described_class.less('field', nil).construct).to eq("field[less]=''&")
      expect(described_class.less(:field, 'value').construct).to eq('field[less]=value&')
      expect(described_class.less(:field, 0).construct).to eq('field[less]=0&')
      expect(described_class.less(:field, '').construct).to eq("field[less]=''&")
      expect(described_class.less(:field, nil).construct).to eq("field[less]=''&")
    end
  end
end
