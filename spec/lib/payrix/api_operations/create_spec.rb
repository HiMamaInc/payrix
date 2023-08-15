# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::Create do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::Create
    end

    stub_const('Txn', klass)
    stub_const('Txn::RESOURCE_ENDPOINT', 'txns')
  end

  describe '.create' do
    context 'when passing nil' do
      it 'raises ArgumentError' do
        expect { Txn.create(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a boolean' do
      it 'raises ArgumentError' do
        expect { Txn.create(true) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a number' do
      it 'raises ArgumentError' do
        expect { Txn.create(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a string' do
      it 'raises ArgumentError' do
        expect { Txn.create('') }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a symbol' do
      it 'raises ArgumentError' do
        expect { Txn.create(:symbol) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing an array' do
      it 'raises ArgumentError' do
        expect { Txn.create([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a hash and the API response contains errors' do
      it 'raises Payrix::ApiError' do
        stub =
          WebMock
            .stub_request(:post, 'https://api.payrix.com/txns')
            .with(
              body: {
                total: -1,
                cofType: 'single',
              }.to_json,
            )
            .to_return(
              status: 200,
              body: {
                response: {
                  data: [],
                  details: {
                    requestId: 1,
                  },
                  errors: [
                    {
                      field: 'total',
                      code: 15,
                      severity: 2,
                      msg: 'This field only accepts integers between 0 and 9000000000',
                      errorCode: 'invalid_range',
                    },
                  ],
                },
              }.to_json,
            )

        expect { Txn.create({ total: -1, cof_type: 'single' }) }.to(
          raise_error(Payrix::ApiError),
        )

        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string and the API response is successful' do
      it 'returns the created object' do
        stub =
          WebMock
            .stub_request(:post, 'https://api.payrix.com/txns')
            .with(
              body: {
                total: 100_00,
                cofType: 'single',
              }.to_json,
            )
            .to_return(
              status: 200,
              body: {
                response: {
                  data: [
                    {
                      id: 't1_txn_64026b07cc6a79dd5cfd0da',
                      status: 1,
                      total: 100_00,
                      cofType: 'single',
                    },
                  ],
                  details: {
                    requestId: 1,
                  },
                  errors: [],
                },
              }.to_json,
            )

        txn = Txn.create({ total: 100_00, cof_type: 'single' })

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
        expect(txn.total).to eq(100_00)
        expect(txn.total).to eq(100_00)
        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string and an options hash' do
      it 'supports resource expansion via the :expand key' do
        stub =
          WebMock
            .stub_request(:post, 'https://api.payrix.com/txns?expand[merchant][]=')
            .with(
              body: {
                total: 100_00,
                cofType: 'single',
              }.to_json,
            )
            .to_return(
              status: 200,
              body: {
                response: {
                  data: [
                    {
                      id: 't1_txn_64026b07cc6a79dd5cfd0da',
                      status: 1,
                      total: 100_00,
                      cofType: 'single',
                      merchant: {
                        id: 't1_mer_64026b07cc6a79dd5cf77d7',
                      },
                    },
                  ],
                  details: {
                    requestId: 1,
                  },
                  errors: [],
                },
              }.to_json,
            )

        txn = Txn.create({ total: 100_00, cof_type: 'single' }, { expand: ['merchant'] })

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.total).to eq(100_00)
        expect(txn.cof_type).to eq('single')
        expect(txn.merchant.id).to eq('t1_mer_64026b07cc6a79dd5cf77d7')
        expect(stub).to have_been_requested
      end

      it 'supports setting the API key per-request via the :api_key key' do
        stub =
          WebMock
            .stub_request(:post, 'https://api.payrix.com/txns')
            .with(
              body: {
                total: 100_00,
                cofType: 'single',
              }.to_json,
              headers: {
                'ApiKey' => 'my-personal-key',
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
                      total: 100_00,
                      cofType: 'single',
                    },
                  ],
                  details: {
                    requestId: 1,
                  },
                  errors: [],
                },
              }.to_json,
            )

        Txn.create({ total: 100_00, cof_type: 'single' }, { api_key: 'my-personal-key' })

        expect(stub).to have_been_requested
      end
    end
  end
end
