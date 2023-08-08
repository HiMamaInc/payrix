# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Less do
  describe '#contstruct' do
    context 'with a nil value' do
      it 'returns an valid less search argument' do
        less = described_class.new(:field, nil)

        expect(less.construct).to eq("field[less]=''")
      end
    end

    context 'with a number value' do
      it 'returns an valid less search argument' do
        less = described_class.new(:field, 0)

        expect(less.construct).to eq('field[less]=0')
      end
    end

    context 'with an empty string value' do
      it 'returns an valid less search argument' do
        less = described_class.new(:field, '')

        expect(less.construct).to eq("field[less]=''")
      end
    end

    context 'with a non-empty string value' do
      it 'returns an valid less search argument' do
        less = described_class.new(:field, 'value')

        expect(less.construct).to eq('field[less]=value')
      end
    end
  end
end
