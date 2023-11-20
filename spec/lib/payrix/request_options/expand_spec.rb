# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Expand do
  describe '.construct' do
    context 'when given nil' do
      it 'returns an empty string' do
        expand = described_class.construct(nil)

        expect(expand).to eq('')
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

    context 'when given a number' do
      it 'raises ArgumentError' do
        expect { described_class.construct(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when given a hash' do
      it 'raises ArgumentError' do
        expect { described_class.construct({}) }.to raise_error(ArgumentError)
      end
    end

    context 'when given an empty array' do
      it 'returns an empty string' do
        expand = described_class.construct([])

        expect(expand).to eq('')
      end
    end

    context 'when given an array of strings and non-strin values' do
      it 'raises ArgumentError' do
        expect { described_class.construct(['', nil, true, :symbol, 0, [], {}]) }.to raise_error(ArgumentError)
      end
    end

    context 'when given an array of one single-level string' do
      it 'returns a correctly formatted query parameter' do
        expand = described_class.construct(['payment'])

        expect(expand).to eq('expand[payment][]=&')
      end
    end

    context 'when given an array of multiple single-level strings' do
      it 'returns a correctly formatted query parameter' do
        expand = described_class.construct(['payment', 'merchant'])

        expect(expand).to eq('expand[payment][]=&expand[merchant][]=&')
      end
    end

    context 'when given an array of one multi-level string' do
      it 'returns a correctly formatted query parameter' do
        expand = described_class.construct(['merchant.entity'])

        expect(expand).to eq('expand[merchant][entity][]=&')
      end
    end

    context 'when given an array of multiple multi-level strings' do
      it 'returns a correctly formatted query parameter' do
        expand = described_class.construct(['merchant.entity.org_entities', 'payment.bin'])

        expect(expand).to eq('expand[merchant][entity][orgEntities][]=&expand[payment][bin][]=&')
      end
    end

    context 'when given an array of multi-level strings unpacking arrays of data' do
      it 'returns a formatted expansion query parameter' do
        expand = described_class.construct(['merchant.entity.org_entities[].org.org_entities[].entity'])

        expect(expand).to eq('expand[merchant][entity][orgEntities][0][org][orgEntities][0][entity][]=&')
      end
    end
  end
end
