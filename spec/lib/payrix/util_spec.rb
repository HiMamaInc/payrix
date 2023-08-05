# frozen_string_literal: true

RSpec.describe Payrix::Util do
  describe '.camel_case' do
    context 'when given a snake-cased string' do
      it 'converts the string to camel case' do
        expect(described_class.camel_case('a_string_value')).to eq('aStringValue')
      end
    end

    context 'when given a camel-cased string' do
      it 'maintains the camel casing' do
        expect(described_class.camel_case('aStringValue')).to eq('aStringValue')
      end
    end
  end

  describe '.snake_case' do
    context 'when given a camel-cased string' do
      it 'converts the string to snake case' do
        expect(described_class.snake_case('aStringValue')).to eq('a_string_value')
      end
    end

    context 'when given a snake-cased string' do
      it 'maintains the snake casing' do
        expect(described_class.snake_case('a_string_value')).to eq('a_string_value')
      end
    end
  end
end
