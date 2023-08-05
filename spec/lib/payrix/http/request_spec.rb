# frozen_string_literal: true

RSpec.describe Payrix::Http::Request do
  describe '#send_http' do
    let(:response_body) { '{}' }

    before do
      stub_request(:get, 'https://test-api.payrix.com/test')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v2.0.1',
          },
        )
        .to_return(status: 200, body: response_body, headers: {})
    end

    context 'when the request is not authenticated' do
      it 'raises Payrix::Exceptions::InvalidAuthentication' do
        WebMock
          .stub_request(:get, 'https://api.payrix.com/txns')
          .to_return(
            status: 401,
            body: {
              errors: [
                {
                  code: 4,
                  severity: 3,
                  msg: 'Invalid authentication',
                  errorCode: 'invalid_auth',
                },
              ],
            }.to_json,
          )

        expect { described_class.instance.send_http(:get, 'https://api.payrix.com', 'txns', {}, {}, 30) }.to(
          raise_error(Payrix::Exceptions::InvalidAuthentication, 'Invalid authentication token'),
        )
      end
    end

    context 'when response is valid json' do
      let(:response_body) { '{}' }

      it 'handles the response' do
        json, status = described_class.instance.send_http('get', 'https://test-api.payrix.com', 'test', {}, {}, 30)
        expect(json).to eq({})
        expect(status).to eq(200)
      end
    end

    context 'when request is invalid json' do
      let(:response_body) { '' }

      it 'raises an exception' do
        expect do
          described_class.instance.send_http('get', 'https://test-api.payrix.com', 'test', {}, {}, 30)
        end.to raise_error(Payrix::Exceptions::InvalidResponse)
      end
    end
  end
end
