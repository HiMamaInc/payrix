RSpec.describe Payrix::ExpandParameter do
  describe '.build_url' do
    context 'when the expand argument is nil' do
      it 'raises ArgumentError' do
        expect { Payrix::ExpandParameter.build_url('/txns', nil) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a string' do
      it 'raises ArgumentError' do
        expect { Payrix::ExpandParameter.build_url('/txns', '') }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a number' do
      it 'raises ArgumentError' do
        expect { Payrix::ExpandParameter.build_url('/txns', 0) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is a hash' do
      it 'raises ArgumentError' do
        expect { Payrix::ExpandParameter.build_url('/txns', {}) }.to(
          raise_error(ArgumentError, 'Expand parameter must be an array of strings'),
        )
      end
    end

    context 'when the expand argument is an array of one single-level string' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        url = Payrix::ExpandParameter.build_url('/txns', ['payment'])

        expect(url).to eq('/txns?expand[payment][]=')
      end
    end

    context 'when the expand argument is an array of multiple single-level strings' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        url = Payrix::ExpandParameter.build_url('/txns', ['payment', 'merchant'])

        expect(url).to eq('/txns?expand[payment][]=&expand[merchant][]=')
      end
    end

    context 'when the expand argument is an array of one multi-level string' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        url = Payrix::ExpandParameter.build_url('/txns', ['merchant.entity'])

        expect(url).to eq('/txns?expand[merchant][entity][]=')
      end
    end

    context 'when the expand argument is an array of multiple multi-level strings' do
      it 'returns the passed in URL concatenated with the expand parameters' do
        url = Payrix::ExpandParameter.build_url('/txns', ['merchant.entity.org_entities', 'payment.bin'])

        expect(url).to eq('/txns?expand[merchant][entity][orgEntities][]=&expand[payment][bin][]=')
      end
    end
  end
end
