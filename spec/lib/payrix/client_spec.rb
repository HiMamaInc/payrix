# frozen_string_literal: true

RSpec.describe Payrix::Client do
  before { allow(Payrix.configuration).to receive(:api_key).and_return('default-key') }

  describe '#request' do
    describe 'GET' do
      it 'supports basic requests' do
        stub =
          WebMock
            .stub_request(:get, 'https://test-api.payrix.com/txns')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'default-key',
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response = client.request(method: :get, resource: 'txns')

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end

      it 'supports advanced requests' do
        stub =
          WebMock
            .stub_request(
              :get,
              'https://api.payrixcanada.com/txns?page[number]=1&page[limit]=10&expand[merchant][]=',
            )
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'custom-key',
                'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response =
          client
            .request(
              method: :get,
              resource: 'txns',
              filters: { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
              options: {
                page: 1,
                limit: 10,
                expand: ['merchant'],
                api_key: 'custom-key',
                region: :ca,
                environment: :production,
              },
            )

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end
    end

    describe 'POST' do
      it 'supports basic requests' do
        stub =
          WebMock
            .stub_request(:post, 'https://test-api.payrix.com/txns')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'default-key',
              },
              body: {
                total: 100_00,
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response = client.request(method: :post, resource: 'txns', data: { total: 100_00 })

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end

      it 'supports advanced requests' do
        stub =
          WebMock
            .stub_request(:post, 'https://api.payrixcanada.com/txns?expand[merchant][]=')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'custom-key',
              },
              body: {
                total: 100_00,
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response =
          client
            .request(
              method: :post,
              resource: 'txns',
              data: {
                total: 100_00,
              },
              options: {
                expand: ['merchant'],
                api_key: 'custom-key',
                region: :ca,
                environment: :production,
              },
            )

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end
    end

    describe 'PUT' do
      it 'supports basic requests' do
        stub =
          WebMock
            .stub_request(:put, 'https://test-api.payrix.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'default-key',
              },
              body: {
                total: 100_00,
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response =
          client
            .request(
              method: :put,
              resource: 'txns/t1_txn_64026b07cc6a79dd5cfd0da',
              data: {
                total: 100_00,
              },
            )

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end

      it 'supports advanced requests' do
        stub =
          WebMock
            .stub_request(:put, 'https://api.payrixcanada.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'custom-key',
              },
              body: {
                total: 100_00,
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response =
          client
            .request(
              method: :put,
              resource: 'txns/t1_txn_64026b07cc6a79dd5cfd0da',
              data: {
                total: 100_00,
              },
              options: {
                api_key: 'custom-key',
                region: :ca,
                environment: :production,
              },
            )

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end
    end

    describe 'DELETE' do
      it 'supports basic requests' do
        stub =
          WebMock
            .stub_request(:delete, 'https://test-api.payrix.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'default-key',
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response = client.request(method: :delete, resource: 'txns/t1_txn_64026b07cc6a79dd5cfd0da')
        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end

      it 'supports advanced requests' do
        stub =
          WebMock
            .stub_request(:delete, 'https://api.payrixcanada.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'custom-key',
              },
            )
            .and_return(
              status: 200,
              body: {
                response: {
                  data: [],
                },
              }.to_json,
            )

        client = described_class.new

        response =
          client
            .request(
              method: :delete,
              resource: 'txns/t1_txn_64026b07cc6a79dd5cfd0da',
              options: {
                api_key: 'custom-key',
                region: :ca,
                environment: :production,
              },
            )

        expect(stub).to have_been_requested
        expect(response.data).to eq([])
      end
    end
  end
end
