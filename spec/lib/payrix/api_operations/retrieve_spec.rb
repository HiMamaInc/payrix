# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::Retrieve do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::Retrieve
    end

    stub_const('Txn', klass)
    stub_const('Txn::RESOURCE_ENDPOINT', 'txns')
  end

  describe '.retrieve' do
    context 'when passing nil' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a boolean' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve(true) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a number' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a symbol' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve(:symbol) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing an array' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a hash' do
      it 'raises ArgumentError' do
        expect { Txn.retrieve({}) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a string, and the API response contains errors' do
      it 'raises Payrix::ApiError' do
        WebMock
          .stub_request(:get, 'https://api.payrix.com/txns')
          .with(
            headers: {
              'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                errors: [
                  {
                    code: 15,
                    severity: 2,
                    errorCode: 'no_such_record',
                  },
                ],
              },
            }.to_json,
          )

        expect { Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da') }.to raise_error(Payrix::ApiError)
      end
    end

    context 'when passing a string, and the API response is empty' do
      it 'raises Payrix::NotFoundError' do
        WebMock
          .stub_request(:get, 'https://api.payrix.com/txns')
          .with(
            headers: {
              'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                data: [],
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

        expect { Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da') }.to raise_error(Payrix::NotFoundError)
      end
    end

    context 'when passing a string and the API response is not empty' do
      it 'returns an object' do
        WebMock
          .stub_request(:get, 'https://api.payrix.com/txns')
          .with(
            headers: {
              'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  {
                    id: 't1_txn_64026b07cc6a79dd5cfd0da',
                    status: 1,
                  },
                ],
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

        txn = Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da')

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
      end
    end

    context 'when passing a string and an options hash' do
      it 'supports resource expansion via the :expand key' do
        WebMock
          .stub_request(:get, 'https://api.payrix.com/txns?expand[merchant][]=')
          .with(
            headers: {
              'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  {
                    id: 't1_txn_64026b07cc6a79dd5cfd0da',
                    status: 1,
                    merchant: {
                      id: 't1_mer_64026b07cc6a79dd5cf77d7',
                    },
                  },
                ],
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

        txn = Txn.retrieve('t1_txn_64026b07cc6a79dd5cfd0da', { expand: ['merchant'] })

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
        expect(txn.merchant.id).to eq('t1_mer_64026b07cc6a79dd5cf77d7')
      end

      it 'supports setting the API key per-request via the :api_key key' do
        stub =
          WebMock
            .stub_request(:get, 'https://api.payrix.com/txns')
            .with(
              headers: {
                'Apikey' => 'my-personal-key',
                'Search' => 'id[equals]=t1_txn_64026b07cc6a79dd5cfd0da',
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
end
