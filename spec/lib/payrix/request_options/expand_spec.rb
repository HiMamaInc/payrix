# frozen_string_literal: true

RSpec.describe Payrix::Expand do
  describe '.construct' do
    context 'when the expand argument is nil' do
      it 'raises ArgumentError' do
        expect { described_class.construct(nil) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a string' do
      it 'raises ArgumentError' do
        expect { described_class.construct('') }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a number' do
      it 'raises ArgumentError' do
        expect { described_class.construct(0) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.construct({}) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is an array of one single-level string' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        expect(described_class.construct(['payment'])).to eq('expand[payment][]=')
      end
    end

    context 'when the expand argument is an array of multiple single-level strings' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        expect(described_class.construct(['payment', 'merchant'])).to eq('expand[payment][]=&expand[merchant][]=')
      end
    end

    context 'when the expand argument is an array of one multi-level string' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        expect(described_class.construct(['merchant.entity'])).to eq('expand[merchant][entity][]=')
      end
    end

    context 'when the expand argument is an array of multiple multi-level strings' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        expect(described_class.construct(['merchant.entity.org_entities', 'payment.bin'])).to(
          eq('expand[merchant][entity][orgEntities][]=&expand[payment][bin][]='),
        )
      end
    end
  end
end
