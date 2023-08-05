RSpec.describe Payrix::Configuration do
  it 'supports setting an API key' do
    configuration = described_class.new

    expect(configuration.api_key).to eq('')

    configuration.api_key = '7E57C3FD328F8B00B2A72144FE2A1F83'

    expect(configuration.api_key).to eq('7E57C3FD328F8B00B2A72144FE2A1F83')
  end

  it 'supports setting a session key' do
    configuration = described_class.new

    expect(configuration.session_key).to eq('')

    configuration.session_key = '7E57C3FD328F8B00B2A72144FE2A1F83'

    expect(configuration.session_key).to eq('7E57C3FD328F8B00B2A72144FE2A1F83')
  end

  describe '#url' do
    context 'when in test mode' do
      it 'returns https://test-api.payrix.com' do
        configuration = described_class.new

        configuration.set_test_mode(true)

        expect(configuration.url).to eq('https://test-api.payrix.com')
      end
    end

    context 'when not in test mode' do
      it 'returns https://api.payrix.com' do
        configuration = described_class.new

        configuration.set_test_mode(false)

        expect(configuration.url).to eq('https://api.payrix.com')
      end
    end
  end
end
