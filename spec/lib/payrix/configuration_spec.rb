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

  describe '#environment=' do
    context "when set to 'sandbox'" do
      it 'sets the environment to sandbox' do
        configuration = described_class.new

        configuration.environment = 'sandbox'

        expect(configuration.environment).to eq(:sandbox)
      end
    end

    context 'when set to :sandbox' do
      it 'sets the environment to sandbox' do
        configuration = described_class.new

        configuration.environment = :sandbox

        expect(configuration.environment).to eq(:sandbox)
      end
    end

    context "when set to 'production'" do
      it 'sets the environment to production' do
        configuration = described_class.new

        configuration.environment = 'production'

        expect(configuration.environment).to eq(:production)
      end
    end

    context 'when set to :production' do
      it 'sets the environment to production' do
        configuration = described_class.new

        configuration.environment = :production

        expect(configuration.environment).to eq(:production)
      end
    end

    context 'when set to an unsupported value' do
      it 'raises Payrix::InvalidEnvironmentError' do
        configuration = described_class.new

        expect { configuration.environment = true }.to raise_error(Payrix::InvalidEnvironmentError)
        expect { configuration.environment = 0 }.to raise_error(Payrix::InvalidEnvironmentError)
        expect { configuration.environment = :test }.to raise_error(Payrix::InvalidEnvironmentError)
        expect { configuration.environment = 'test' }.to raise_error(Payrix::InvalidEnvironmentError)
        expect { configuration.environment = [] }.to raise_error(Payrix::InvalidEnvironmentError)
        expect { configuration.environment = {} }.to raise_error(Payrix::InvalidEnvironmentError)
      end
    end
  end

  describe '#region=' do
    context "when set to 'us'" do
      it 'sets the region to US' do
        configuration = described_class.new

        configuration.region = 'us'

        expect(configuration.region).to eq(:us)
      end
    end

    context 'when set to :us' do
      it 'sets the region to US' do
        configuration = described_class.new

        configuration.region = :us

        expect(configuration.region).to eq(:us)
      end
    end

    context "when set to 'ca'" do
      it 'sets the region to CA' do
        configuration = described_class.new

        configuration.region = 'ca'

        expect(configuration.region).to eq(:ca)
      end
    end

    context 'when set to :ca' do
      it 'sets the region to CA' do
        configuration = described_class.new

        configuration.region = :ca

        expect(configuration.region).to eq(:ca)
      end
    end

    context 'when set to an unsupported value' do
      it 'raises Payrix::InvalidRegionError' do
        configuration = described_class.new

        expect { configuration.region = true }.to raise_error(Payrix::InvalidRegionError)
        expect { configuration.region = 0 }.to raise_error(Payrix::InvalidRegionError)
        expect { configuration.region = :uk }.to raise_error(Payrix::InvalidRegionError)
        expect { configuration.region = 'uk' }.to raise_error(Payrix::InvalidRegionError)
        expect { configuration.region = [] }.to raise_error(Payrix::InvalidRegionError)
        expect { configuration.region = {} }.to raise_error(Payrix::InvalidRegionError)
      end
    end
  end

  describe '#url' do
    # rubocop:disable RSpec/NestedGroups
    describe 'region is not configured' do
      context 'when region override is not passed' do
        it 'raises Payrix::InvalidRegionError' do
          configuration = described_class.new

          expect { configuration.url }.to raise_error(Payrix::InvalidRegionError)
        end
      end

      context 'when region override is passed (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          expect(configuration.url(:us)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when region override is passed (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          expect(configuration.url(:ca)).to eq('https://test-api.payrixcanada.com')
        end
      end
    end

    describe 'region is US' do
      context 'when environment not configured, no environment override, no region override' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment not configured, no environment override, region override (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url(:ca)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment not configured, environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment not configured, environment override (sandbox), region override (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url(:ca, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment not configured, environment override (production), no region override' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url(nil, :production)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment not configured, environment override (production), region override (ca)' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us

          expect(configuration.url(:ca, :production)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), no environment override, no region override' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), no environment override, region override (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url(:ca)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), environment override (sandbox), region override (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url(:ca, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), environment override (production), no region override' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url(nil, :production)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), environment override (production), region override (ca)' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :sandbox

          expect(configuration.url(:ca, :production)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), no environment override, no region override' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (production), no environment override, region override (ca)' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url(:ca)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (production), environment override (sandbox), region override (ca)' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url(:ca, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), environment override (production), no region override' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url(nil, :production)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (production), environment override (production), region override (ca)' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :us
          configuration.environment = :production

          expect(configuration.url(:ca, :production)).to eq('https://api.payrixcanada.com')
        end
      end
    end

    describe 'region is CA' do
      context 'when environment not configured, no environment override, no region override' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment not configured, no environment override, region override (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url(:us)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment not configured, environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment not configured, environment override (sandbox), region override (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url(:us, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment not configured, environment override (production), no region override' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url(nil, :production)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment not configured, environment override (production), region override (us)' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca

          expect(configuration.url(:us, :production)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), no environment override, no region override' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), no environment override, region override (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url(:us)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), environment override (sandbox), region override (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url(:us, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (sandbox), environment override (production), no region override' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url(nil, :production)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (sandbox), environment override (production), region override (us)' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :sandbox

          expect(configuration.url(:us, :production)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (production), no environment override, no region override' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), no environment override, region override (us)' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url(:us)).to eq('https://api.payrix.com')
        end
      end

      context 'when environment configured (production), environment override (sandbox), no region override' do
        it 'returns the sandbox URL https://test-api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url(nil, :sandbox)).to eq('https://test-api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), environment override (sandbox), region override (us)' do
        it 'returns the sandbox URL https://test-api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url(:us, :sandbox)).to eq('https://test-api.payrix.com')
        end
      end

      context 'when environment configured (production), environment override (production), no region override' do
        it 'returns the production URL https://api.payrixcanada.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url(nil, :production)).to eq('https://api.payrixcanada.com')
        end
      end

      context 'when environment configured (production), environment override (production), region override (us)' do
        it 'returns the production URL https://api.payrix.com' do
          configuration = described_class.new

          configuration.region = :ca
          configuration.environment = :production

          expect(configuration.url(:us, :production)).to eq('https://api.payrix.com')
        end
      end
    end
    # rubocop:enable RSpec/NestedGroups
  end
end
