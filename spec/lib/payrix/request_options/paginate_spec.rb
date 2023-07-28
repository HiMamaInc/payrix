RSpec.describe Payrix::Paginate do
  describe '.construct' do
    it 'returns a pagination string that can be appended to the URL of an API call' do
      expect(Payrix::Paginate.construct(0)).to eq('page[number]=0&')
      expect(Payrix::Paginate.construct(1)).to eq('page[number]=1&')
      expect(Payrix::Paginate.construct(10)).to eq('page[number]=10&')
    end
  end
end
