# frozen_string_literal: true

RSpec.describe Payrix::List do
  before do
    stub_const('Txn', Class.new)
    stub_const('Txn::RESOURCE_ENDPOINT', 'txns')
  end

  describe '#initialize' do
    context 'when a hash filter is given' do
      it 'instantiates and requests the 1st page with the filter' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
          .with(
            headers: {
              'Search' => 'status[equals]=1',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da', status: 1 },
                  { id: 't1_txn_58826b07eb6a79dd5cfd010', status: 1 },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 3,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: { status: 1 })
        array = list.to_a

        expect(array[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(array[0].status).to eq(1)
        expect(array[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
        expect(array[1].status).to eq(1)
      end
    end

    context 'when a node filter is given' do
      it 'instantiates and requests the 1st page with the filter' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
          .with(
            headers: {
              'Search' => 'amount[greater]=10000',
            },
          )
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da', amount: 100_00 },
                  { id: 't1_txn_58826b07eb6a79dd5cfd010', amount: 175_23 },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 3,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: Payrix::Search.greater(:amount, 100_00))
        array = list.to_a

        expect(array[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(array[0].amount).to eq(100_00)
        expect(array[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
        expect(array[1].amount).to eq(175_23)
      end
    end

    context 'when page is a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: true }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is a string' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: '' }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is a symbol' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: :page }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is an array' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: [] }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: {} }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is nil' do
      it 'instantiates and requests the 1st page' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
                  { id: 't1_txn_58826b07eb6a79dd5cfd010' },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 3,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: {}, options: { page: nil })
        array = list.to_a

        expect(array[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(array[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
      end
    end

    context 'when page is less than 1' do
      it 'raises ArgumentError' do
        expect { described_class.new(klass: Txn, filters: {}, options: { page: 0 }) }.to(
          raise_error(ArgumentError),
        )
      end
    end

    context 'when page is 1' do
      it 'instantiates and requests the 1st page' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
                  { id: 't1_txn_58826b07eb6a79dd5cfd010' },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 3,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: {}, options: { page: 1 })
        array = list.to_a

        expect(array[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(array[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
      end
    end

    context 'when page is greater than 1' do
      it 'instantiates and requests the nth page' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=15')
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
                  { id: 't1_txn_58826b07eb6a79dd5cfd010' },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 20,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: {}, options: { page: 15 })
        array = list.to_a

        expect(array[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(array[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
      end
    end

    context 'when limit is given' do
      it 'limits the number of records per page' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1&page[limit]=1')
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
                ],
                details: {
                  requestId: 1,
                  totals: [],
                  page: {
                    current: 1,
                    last: 20,
                    hasMore: true,
                  },
                },
                errors: [],
              },
            }.to_json,
          )

        list = described_class.new(klass: Txn, filters: {}, options: { limit: 1 })

        expect(list.first.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
      end
    end

    context 'when expand is given' do
      it 'supports resource expansion' do
        WebMock
          .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1&expand[merchant][]=')
          .to_return(
            status: 200,
            body: {
              response: {
                data: [
                  {
                    id: 't1_txn_64026b07cc6a79dd5cfd0da',
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

        list = described_class.new(klass: Txn, filters: {}, options: { expand: ['merchant'] })

        expect(list.first.id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(list.first.merchant.id).to eq('t1_mer_64026b07cc6a79dd5cf77d7')
      end
    end

    context 'when API key is given' do
      it 'supports setting the API key per-request' do
        stub =
          WebMock
            .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
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
                    { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
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

        described_class.new(klass: Txn, filters: {}, options: { api_key: 'my-personal-key' })

        expect(stub).to have_been_requested
      end
    end
  end

  describe 'Pagination' do
    before do
      WebMock
        .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=1')
        .to_return(
          status: 200,
          body: {
            response: {
              data: [
                { id: 't1_txn_64026b07cc6a79dd5cfd0da' },
                { id: 't1_txn_58826b07eb6a79dd5cfd010' },
              ],
              details: {
                requestId: 1,
                totals: [],
                page: {
                  current: 1,
                  last: 3,
                  hasMore: true,
                },
              },
              errors: [],
            },
          }.to_json,
        )

      WebMock
        .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=2')
        .to_return(
          status: 200,
          body: {
            response: {
              data: [
                { id: 't1_txn_64026b07cc6a79ddbbbbc45' },
                { id: 't1_txn_588dfb07884a79dd5cfd010' },
              ],
              details: {
                requestId: 1,
                totals: [],
                page: {
                  current: 2,
                  last: 3,
                  hasMore: true,
                },
              },
              errors: [],
            },
          }.to_json,
        )

      WebMock
        .stub_request(:get, 'https://test-api.payrix.com/txns?page[number]=3')
        .to_return(
          status: 200,
          body: {
            response: {
              data: [
                { id: 't1_txn_64026b07cc6a884cbedbc67' },
              ],
              details: {
                requestId: 1,
                totals: [],
                page: {
                  current: 3,
                  last: 3,
                  hasMore: false,
                },
              },
              errors: [],
            },
          }.to_json,
        )
    end

    describe '#page_forward' do
      it 'pages forward through the API' do
        list = described_class.new(klass: Txn)

        expect(list.count).to eq(2)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(list.to_a[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')

        list.page_forward

        expect(list.count).to eq(2)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a79ddbbbbc45')
        expect(list.to_a[1].id).to eq('t1_txn_588dfb07884a79dd5cfd010')

        list.page_forward

        expect(list.count).to eq(1)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a884cbedbc67')
      end
    end

    describe '#page_backward' do
      it 'pages backward through the API (with clamping at the first page)' do
        list = described_class.new(klass: Txn, filters: {}, options: { page: 3 })

        expect(list.count).to eq(1)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a884cbedbc67')

        list.page_backward

        expect(list.count).to eq(2)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a79ddbbbbc45')
        expect(list.to_a[1].id).to eq('t1_txn_588dfb07884a79dd5cfd010')

        list.page_backward

        expect(list.count).to eq(2)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(list.to_a[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')

        # Clamped
        list.page_backward

        expect(list.count).to eq(2)
        expect(list.to_a[0].id).to eq('t1_txn_64026b07cc6a79dd5cfd0da')
        expect(list.to_a[1].id).to eq('t1_txn_58826b07eb6a79dd5cfd010')
      end
    end

    describe '#each' do
      it 'supports iterating through each item in the current page' do
        list = described_class.new(klass: Txn)

        array = []

        list.each { |item| array.push(item.id) }

        expect(array).to eq(['t1_txn_64026b07cc6a79dd5cfd0da', 't1_txn_58826b07eb6a79dd5cfd010'])
      end
    end

    describe '#more?' do
      it 'returns a boolean to indicate if there are more items' do
        list = described_class.new(klass: Txn)

        expect(list.more?).to be(true)

        list.page_forward

        expect(list.more?).to be(true)

        list.page_forward

        expect(list.more?).to be(false)

        list.page_backward

        expect(list.more?).to be(true)
      end
    end

    describe '#auto_paging_each' do
      it 'supports iterating through the list, automatically making requests for new pages' do
        list = described_class.new(klass: Txn)

        array = []

        list.auto_paging_each { |item| array.push(item.id) }

        expect(array).to(
          eq(
            [
              't1_txn_64026b07cc6a79dd5cfd0da',
              't1_txn_58826b07eb6a79dd5cfd010',
              't1_txn_64026b07cc6a79ddbbbbc45',
              't1_txn_588dfb07884a79dd5cfd010',
              't1_txn_64026b07cc6a884cbedbc67',
            ],
          ),
        )
      end
    end

    describe '#auto_paging_count' do
      it 'supports counting the list, automaticallly making requests for new pages' do
        list = described_class.new(klass: Txn)

        expect(list.auto_paging_count).to eq(5)
      end
    end

    describe '#auto_paging_map' do
      it 'supports mapping through the list, automatically making requests for new pages' do
        list = described_class.new(klass: Txn)

        array = list.auto_paging_map(&:id)

        expect(array).to(
          eq(
            [
              't1_txn_64026b07cc6a79dd5cfd0da',
              't1_txn_58826b07eb6a79dd5cfd010',
              't1_txn_64026b07cc6a79ddbbbbc45',
              't1_txn_588dfb07884a79dd5cfd010',
              't1_txn_64026b07cc6a884cbedbc67',
            ],
          ),
        )
      end
    end
  end
end
