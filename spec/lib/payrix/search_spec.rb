RSpec.describe Payrix::Search do
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
