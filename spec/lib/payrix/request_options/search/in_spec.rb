# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::In do
  describe '#construct' do
    context 'with a nil value' do
      it 'returns a valid search filter' do
        search_in = described_class.new(:field, nil)

        expect(search_in.construct).to eq("field[in]=''")
      end
    end

    context 'with an empty array' do
      it 'returns a valid search filter' do
        search_in = described_class.new(:field, [])

        expect(search_in.construct).to eq("field[in]=''")
      end
    end

    context 'with an empty string value' do
      it 'returns a valid search filter' do
        search_in = described_class.new(:field, '')

        expect(search_in.construct).to eq("field[in]=''")
      end
    end

    context 'with a single non-array value' do
      it 'returns a valid search filter' do
        search_in = described_class.new(:field, 'value')

        expect(search_in.construct).to eq('field[in]=value')
      end
    end

    context 'with a number value' do
      it 'returns a valid search filter' do
        search_in = described_class.new(:field, [1, 2])

        expect(search_in.construct).to eq('field[in]=1,2')
      end
    end

    context 'with multiple string values' do
      it 'returns a comma-separated search filter' do
        search_in = described_class.new('merchant', ['t1_mer_1', 't1_mer_2'])

        expect(search_in.construct).to eq('merchant[in]=t1_mer_1,t1_mer_2')
      end
    end

    context 'with a prefix' do
      it 'returns a valid nested search filter' do
        search_in = described_class.new(:merchant, ['a', 'b'])

        expect(search_in.construct('and[0]')).to eq('and[0][merchant][in]=a,b')
      end
    end
  end
end
