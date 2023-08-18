# frozen_string_literal: true

RSpec.describe Payrix::APIOperations::Update do
  before do
    klass = Class.new(Payrix::BaseResource) do
      extend Payrix::APIOperations::Update
    end

    stub_const('Customer', klass)
    stub_const('Customer::RESOURCE_ENDPOINT', 'customers')
  end

  describe '.update' do
    context 'when passing nil for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update(nil, { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a boolean for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update(true, { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a number for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update(0, { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a symbol for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update(:symbol, { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing an array for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update([], { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a hash for the ID' do
      it 'raises ArgumentError' do
        expect { Customer.update({}, { first: 'Joy' }) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing nil for the fields' do
      it 'raises ArgumentError' do
        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a boolean for the fields' do
      it 'raises ArgumentError' do
        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', true) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a number for the fields' do
      it 'raises ArgumentError' do
        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', 0) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a symbol for the fields' do
      it 'raises ArgumentError' do
        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', :symbol) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing an array for the fields' do
      it 'raises ArgumentError' do
        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', []) }.to raise_error(ArgumentError)
      end
    end

    context 'when passing a string for the ID, a hash for the fields, and the API response contains errors' do
      it 'raises Payrix::ApiError' do
        stub =
          WebMock
            .stub_request(:put, 'https://api.payrix.com/customers/t1_cus_64d511636b66052bb4dec9c')
            .with(
              body: {
                entity: 't1_ent_640b4c3ddd3dd258e691501',
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
                      field: 'entity',
                      code: 16,
                      severity: 2,
                      msg: 'The referenced resource does not exist',
                      errorCode: 'no_such_record',
                    },
                  ],
                },
              }.to_json,
            )

        expect { Customer.update('t1_cus_64d511636b66052bb4dec9c', { entity: 't1_ent_640b4c3ddd3dd258e691501' }) }.to(
          raise_error(Payrix::ApiError),
        )

        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string for the ID, a hash for the fields, and the API response is successful' do
      it 'returns the created object' do
        stub =
          WebMock
            .stub_request(:put, 'https://api.payrix.com/customers/t1_cus_64d511636b66052bb4dec9c')
            .with(
              body: {
                first: 'Joseph',
                shippingFirst: 'Joy',
              }.to_json,
            )
            .to_return(
              status: 200,
              body: {
                response: {
                  data: [
                    {
                      id: 't1_cus_64d511636b66052bb4dec9c',
                      first: 'Joseph',
                      shippingFirst: 'Joy',
                    },
                  ],
                  details: {
                    requestId: 1,
                  },
                  errors: [],
                },
              }.to_json,
            )

        customer = Customer.update('t1_cus_64d511636b66052bb4dec9c', { first: 'Joseph', shipping_first: 'Joy' })

        expect(customer.id).to eq('t1_cus_64d511636b66052bb4dec9c')
        expect(customer.first).to eq('Joseph')
        expect(customer.shipping_first).to eq('Joy')
        expect(stub).to have_been_requested
      end
    end

    context 'when passing a string for the ID, a hash for the fields, and an options hash' do
      it 'supports setting the API key per-request via the :api_key key' do
        stub =
          WebMock
            .stub_request(:put, 'https://api.payrix.com/customers/t1_cus_64d511636b66052bb4dec9c')
            .with(
              body: {
                first: 'Joseph',
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
                      id: 't1_cus_64d511636b66052bb4dec9c',
                      first: 'Joseph',
                      shippingFirst: 'Joy',
                    },
                  ],
                  details: {
                    requestId: 1,
                  },
                  errors: [],
                },
              }.to_json,
            )

        Customer.update('t1_cus_64d511636b66052bb4dec9c', { first: 'Joseph' }, { api_key: 'my-personal-key' })

        expect(stub).to have_been_requested
      end
    end
  end
end
