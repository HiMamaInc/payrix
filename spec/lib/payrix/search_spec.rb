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
end
