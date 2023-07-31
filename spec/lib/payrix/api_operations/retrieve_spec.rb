RSpec.describe Payrix::APIOperations::Retrieve do
  Txn = Class.new(Payrix::BaseResource) do
    self::RESOURCE_ENDPOINT = 'txns'

    extend Payrix::APIOperations::Retrieve
  end

  describe '.retrieve' do
    context 'when passing a number argument' do
      it 'raises Payrix::Exceptions::ResourceNotFound' do
        expect { Txn.retrieve(1) }.to(
          raise_error(Payrix::Exceptions::ResourceNotFound, "Couldn't find Txn without ID"),
        )
      end
    end

    context 'when passing an array argument' do
      it 'raises Payrix::Exceptions::ResourceNotFound' do
        expect { Txn.retrieve([]) }.to(
          raise_error(Payrix::Exceptions::ResourceNotFound, "Couldn't find Txn without ID"),
        )
      end
    end

    context 'when passing a hash argument' do
      it 'raises Payrix::Exceptions::ResourceNotFound' do
        expect { Txn.retrieve({}) }.to(
          raise_error(Payrix::Exceptions::ResourceNotFound, "Couldn't find Txn without ID"),
        )
      end
    end

    context 'when passing a string argument' do
      it 'raises Payrix::Exceptions::ResourceNotFound if the API returns an empty response' do
        mock_request(
          url: 'https://api.payrix.com/txns',
          id: 't1_txn_64026b07cc6a79dd5cfd0da',
          data: [],
        )

        expect { Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da') }.to(
          raise_error(Payrix::Exceptions::ResourceNotFound, "Couldn't find Txn with id='t1_txn_64026b07cc6a79dd5cfd0da'"),
        )
      end

      it 'returns Payrix resource instance if the API returns a non-empty response' do
        mock_request(
          url: 'https://api.payrix.com/txns',
          id: 't1_txn_64026b07cc6a79dd5cfd0da',
          data: [{ id: 't1_txn_64026b07cc6a79dd5cfd0da', status: 1 }],
        )

        txn = Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da')

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
      end
    end

    context 'when passing an options hash as the second parameter' do
      it 'supports passing an :expand key to use the expand API feature' do
        mock_request(
          url: 'https://api.payrix.com/txns?expand[merchant][]=',
          id: 't1_txn_64026b07cc6a79dd5cfd0da',
          data: [{ id: 't1_txn_64026b07cc6a79dd5cfd0da', status: 1 }],
        )

        txn = Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da', { expand: ['merchant'] })

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
      end

      it 'supports passing an :api_key to authenticate the request' do
        stub =
          WebMock
            .stub_request(:get, 'https://api.payrix.com/txns')
            .with(
              headers: {
                'Content-Type' => 'application/json',
                'Apikey' => 'my-personal-key',
                'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da&',
              },
            )
            .to_return(
              status: 200,
              body: {
                response: {
                  data: [{}],
                  details: {
                    requestId: 1,
                    totals: [],
                    page: {
                      current: 1,
                      last: 1,
                      hasMore: false,
                    },
                  },
                  errors: [],
                },
              }.to_json,
            )

        Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da', { api_key: 'my-personal-key' })

        expect(stub).to have_been_requested
      end
    end
  end

  def mock_request(url:, id:, data:)
    allow(Payrix.configuration).to receive(:api_key).and_return('7E57C3FD328F8B00B2A72144FE2A1F83')

    WebMock
      .stub_request(:get, url)
      .with(
        headers: {
          'Content-Type' => 'application/json',
          'Apikey' => '7E57C3FD328F8B00B2A72144FE2A1F83',
          'Search' => "id[equals]=#{id}&",
        },
      )
      .to_return(
        status: 200,
        body: {
          response: {
            data: data,
            details: {
              requestId: 1,
              totals: [],
              page: {
                current: 1,
                last: 1,
                hasMore: false,
              },
            },
            errors: [],
          },
        }.to_json,
      )
  end
end
