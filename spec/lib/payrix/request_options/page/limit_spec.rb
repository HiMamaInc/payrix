# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Page::Limit do
  describe '.construct' do
    context 'when given nil' do
      it 'returns an empty string' do
        limit = described_class.construct(nil)

        expect(limit).to eq('')
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

    context 'when given a number greater than 100' do
      it 'raises ArgumentError' do
        expect { described_class.construct(101) }.to raise_error(ArgumentError)
      end
    end

    context 'when given 1' do
      it 'returns a correctly formatted query parameter' do
        limit = described_class.construct(1)

        expect(limit).to eq('page[limit]=1&')
      end
    end

    context 'when given 100' do
      it 'returns a correctly formatted query parameter' do
        limit = described_class.construct(100)

        expect(limit).to eq('page[limit]=100&')
      end
    end

    context 'when given a number between 1 and 100' do
      it 'returns a correctly formatted query parameter' do
        limit = described_class.construct(37)

        expect(limit).to eq('page[limit]=37&')
      end
    end
  end
end
