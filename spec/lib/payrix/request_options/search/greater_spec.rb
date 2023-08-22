# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Greater do
  describe '#contstruct' do
    context 'with a nil value' do
      it 'returns a valid search filter' do
        greater = described_class.new(:field, nil)

        expect(greater.construct).to eq("field[greater]=''")
      end
    end

    context 'with a number value' do
      it 'returns a valid search filter' do
        greater = described_class.new(:field, 0)

        expect(greater.construct).to eq('field[greater]=0')
      end
    end

    context 'with an empty string value' do
      it 'returns a valid search filter' do
        greater = described_class.new(:field, '')

        expect(greater.construct).to eq("field[greater]=''")
      end
    end

    context 'with a non-empty string value' do
      it 'returns a valid search filter' do
        greater = described_class.new(:field, 'value')

        expect(greater.construct).to eq('field[greater]=value')
      end
    end
  end
end
