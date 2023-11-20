# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::And do
  describe '#construct' do
    context 'with atom nodes' do
      it 'returns a valid search filter' do
        and_ = described_class.new(Payrix::Search.equals(:A, 1), Payrix::Search.equals(:B, 2))

        expect(and_.construct).to eq('and[0][A][equals]=1&and[1][B][equals]=2')
      end
    end

    context 'with compound nodes' do
      it 'returns a valid search filter' do
        and_ =
          described_class
            .new(
              Payrix::Search.or(
                Payrix::Search.equals(:A, 1),
                Payrix::Search.equals(:B, 2),
                Payrix::Search.equals(:C, 3),
              ),
              Payrix::Search.or(
                Payrix::Search.equals(:D, 4),
                Payrix::Search.equals(:E, 5),
              ),
            )

        expect(and_.construct).to(
          eq(
            'and[0][or][0][A][equals]=1&' \
            'and[0][or][1][B][equals]=2&' \
            'and[0][or][2][C][equals]=3&' \
            'and[1][or][0][D][equals]=4&' \
            'and[1][or][1][E][equals]=5',
          ),
        )
      end
    end
  end
end
