# frozen_string_literal: true

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
    context 'when no arguments are passed and the default test mode is on' do
      it 'returns https://test-api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = true

        expect(configuration.url).to eq('https://test-api.payrix.com')
      end
    end

    context 'when no arguments are passed and the default test mode is off' do
      it 'returns https://api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = false

        expect(configuration.url).to eq('https://api.payrix.com')
      end
    end

    context 'when nil is passed and the default test mode is on' do
      it 'returns https://test-api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = true

        expect(configuration.url(nil)).to eq('https://test-api.payrix.com')
      end
    end

    context 'when nil is passed and the default test mode is off' do
      it 'returns https://api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = false

        expect(configuration.url(nil)).to eq('https://api.payrix.com')
      end
    end

    context 'when true is passed and the default test mode is on' do
      it 'returns https://test-api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = true

        expect(configuration.url(true)).to eq('https://test-api.payrix.com')
      end
    end

    context 'when true is passed and the default test mode is off' do
      it 'returns https://test-api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = false

        expect(configuration.url(true)).to eq('https://test-api.payrix.com')
      end
    end

    context 'when false is passed and the default test mode is on' do
      it 'returns https://api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = true

        expect(configuration.url(false)).to eq('https://api.payrix.com')
      end
    end

    context 'when false is passed and the default test mode is off' do
      it 'returns https://api.payrix.com' do
        configuration = described_class.new

        configuration.test_mode = false

        expect(configuration.url(false)).to eq('https://api.payrix.com')
      end
    end
  end
end
