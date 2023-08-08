# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Equals do
  describe '#construct' do
    context 'with a nil value' do
      it 'returns an valid equals search argument' do
        equals = described_class.new(:field, nil)

        expect(equals.construct).to eq("field[equals]=''")
      end
    end

    context 'with a number value' do
      it 'returns an valid equals search argument' do
        equals = described_class.new(:field, 0)

        expect(equals.construct).to eq('field[equals]=0')
      end
    end

    context 'with an empty string value' do
      it 'returns an valid equals search argument' do
        equals = described_class.new(:field, '')

        expect(equals.construct).to eq("field[equals]=''")
      end
    end

    context 'with a non-empty string value' do
      it 'returns an valid equals search argument' do
        equals = described_class.new(:field, 'value')

        expect(equals.construct).to eq('field[equals]=value')
      end
    end
  end
end
