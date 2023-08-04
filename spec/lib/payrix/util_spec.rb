RSpec.describe Payrix::Util do
  describe '.camel_case' do
    it 'converts a snake-cased string to camel case' do
      expect(described_class.camel_case('a_string_value')).to eq('aStringValue')
    end
  end

  describe '.snake_case' do
    it 'converts a camel-case string to snake case' do
      expect(described_class.snake_case('aStringValue')).to eq('a_string_value')
    end
  end
end
