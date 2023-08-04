RSpec.describe Payrix::Util do
  describe '.camel_case' do
    it 'converts a snake-cased string to camel case' do
      expect(described_class.camel_case('a_string_value')).to eq('aStringValue')
    end
  end
end
