# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Page::Number do
  describe '.construct' do
    context 'when given nil' do
      it 'returns an empty string' do
        number = described_class.construct(nil)

        expect(number).to eq('')
      end
    end

    context 'when given a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.construct(true) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a symbol' do
      it 'raises ArgumentError' do
        expect { described_class.construct(:symbol) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a string' do
      it 'raises ArgumentError' do
        expect { described_class.construct('') }.to raise_error(ArgumentError)
      end
    end

    context 'when given an array' do
      it 'raises ArgumentError' do
        expect { described_class.construct([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a hash' do
      it 'raises ArgumentError' do
        expect { described_class.construct({}) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a number less than 1' do
      it 'raises ArgumentError' do
        expect { described_class.construct(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when given 1' do
      it 'returns a correctly formatted query parameter' do
        number = described_class.construct(1)

        expect(number).to eq('page[number]=1&')
      end
    end

    context 'when given a number greater than 1' do
      it 'returns a correctly formatted query parameter' do
        number = described_class.construct(100)

        expect(number).to eq('page[number]=100&')
      end
    end
  end
end
