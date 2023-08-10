# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::Delete do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::Delete
    end

    stub_const('Txn', klass)
    stub_const('Txn::RESOURCE_ENDPOINT', 'txns')
  end

  describe '.delete' do
    context 'when passing nil' do
      it 'raises ArgumentError' do
        expect { Txn.delete(nil) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing a boolean' do
      it 'raises ArgumentError' do
        expect { Txn.delete(true) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing a number' do
      it 'raises ArgumentError' do
        expect { Txn.delete(0) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing a symbol' do
      it 'raises ArgumentError' do
        expect { Txn.delete(:symbol) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing an array' do
      it 'raises ArgumentError' do
        expect { Txn.delete([]) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing a hash' do
      it 'raises ArgumentError' do
        expect { Txn.delete({}) }.to(
          raise_error(ArgumentError, 'Txn.delete takes a string argument'),
        )
      end
    end

    context 'when passing a string and the API response contains errors' do
      it 'raises Payrix::ApiError' do
        stub =
          WebMock
            .stub_request(:delete, 'https://api.payrix.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .to_return(
              status: 200,
              body: {
                errors: [
                  {
                    code: 13,
                    severity: 4,
                    msg: 'No such action and/or resource',
                    errorCode: 'invalid_resource',
                  },
                ],
              }.to_json,
            )

        expect { Txn.delete('t1_txn_64026b07cc6a79dd5cfd0da') }.to(
          raise_error(Payrix::ApiError, 'There are errors in the response'),
        )

        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string and the API response is successful' do
      it 'returns the deleted object' do
        stub =
          WebMock
            .stub_request(:delete, 'https://api.payrix.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
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
                  },
                  errors: [],
                },
              }.to_json,
            )

        txn = Txn.delete('t1_txn_64026b07cc6a79dd5cfd0da')

        expect(txn.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(txn.status).to eq(1)
        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string and an options hash' do
      it 'supports setting the API key per-request via the :api_key key' do
        stub =
          WebMock
            .stub_request(:delete, 'https://api.payrix.com/txns/t1_txn_64026b07cc6a79dd5cfd0da')
            .with(
              headers: {
                'Apikey' => 'my-personal-key',
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
                  },
                  errors: [],
                },
              }.to_json,
            )

        Txn.delete('t1_txn_64026b07cc6a79dd5cfd0da', { api_key: 'my-personal-key' })

        expect(stub).to have_been_requested
      end
    end
  end
end
