RSpec.describe Payrix::Search do
  describe '.construct' do
    context 'when passing a number argument' do
      it 'raises ArgumentError' do
        expect { Payrix::Search.construct(0) }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node')
        )
      end
    end

    context 'when passing an array argument' do
      it 'raises ArgumentError' do
        expect { Payrix::Search.construct(0) }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node')
        )
      end
    end

    context 'when passing a string argument' do
      it 'raises ArgumentError' do
        expect { Payrix::Search.construct(0) }.to(
          raise_error(ArgumentError, 'Search parameter must be a hash or an instance of Payrix::Search::Node')
        )
      end
    end

    context 'when passing an empty hash argument' do
      it 'returns an empty string' do
        expect(Payrix::Search.construct({})).to eq('')
      end
    end

    context 'when passing a non-empty hash argument' do
      it 'returns a search string using the equals operator' do
        expect(Payrix::Search.construct({ status: 2, authorized: 1 })).to(
          eq('status[equals]=2&authorized[equals]=1&'),
        )
      end
    end

    context 'when passing an instance of Payrix::Search::Node' do
      it 'returns a search string using the node operator' do
        node = Payrix::Search.greater(:status, 1)

        expect(Payrix::Search.construct(node)).to eq('status[greater]=1&')
      end
    end
  end

  describe '.equals' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(Payrix::Search.equals('field', 'value').construct).to eq('field[equals]=value&')
      expect(Payrix::Search.equals('field', 0).construct).to eq('field[equals]=0&')
      expect(Payrix::Search.equals('field', '').construct).to eq("field[equals]=''&")
      expect(Payrix::Search.equals('field', nil).construct).to eq("field[equals]=''&")
      expect(Payrix::Search.equals(:field, 'value').construct).to eq('field[equals]=value&')
      expect(Payrix::Search.equals(:field, 0).construct).to eq('field[equals]=0&')
      expect(Payrix::Search.equals(:field, '').construct).to eq("field[equals]=''&")
      expect(Payrix::Search.equals(:field, nil).construct).to eq("field[equals]=''&")
    end
  end

  describe '.greater' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(Payrix::Search.greater('field', 'value').construct).to eq('field[greater]=value&')
      expect(Payrix::Search.greater('field', 0).construct).to eq('field[greater]=0&')
      expect(Payrix::Search.greater('field', '').construct).to eq("field[greater]=''&")
      expect(Payrix::Search.greater('field', nil).construct).to eq("field[greater]=''&")
      expect(Payrix::Search.greater(:field, 'value').construct).to eq('field[greater]=value&')
      expect(Payrix::Search.greater(:field, 0).construct).to eq('field[greater]=0&')
      expect(Payrix::Search.greater(:field, '').construct).to eq("field[greater]=''&")
      expect(Payrix::Search.greater(:field, nil).construct).to eq("field[greater]=''&")
    end
  end

  describe '.less' do
    it 'returns an object that can be used to #construct a string for API use' do
      expect(Payrix::Search.less('field', 'value').construct).to eq('field[less]=value&')
      expect(Payrix::Search.less('field', 0).construct).to eq('field[less]=0&')
      expect(Payrix::Search.less('field', '').construct).to eq("field[less]=''&")
      expect(Payrix::Search.less('field', nil).construct).to eq("field[less]=''&")
      expect(Payrix::Search.less(:field, 'value').construct).to eq('field[less]=value&')
      expect(Payrix::Search.less(:field, 0).construct).to eq('field[less]=0&')
      expect(Payrix::Search.less(:field, '').construct).to eq("field[less]=''&")
      expect(Payrix::Search.less(:field, nil).construct).to eq("field[less]=''&")
    end
  end
end