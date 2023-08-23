# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Or do
  describe '#construct' do
    context 'with atom nodes' do
      it 'returns a valid search filter' do
        or_ = described_class.new(Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2))

        expect(or_.construct).to eq('or[0][A][equals]=1&or[1][A][equals]=2')
      end
    end

    context 'with compound nodes' do
      it 'returns a valid search filter' do
        or_ =
          described_class
            .new(
              Payrix::Search.and(
                Payrix::Search.equals(:A, 1),
                Payrix::Search.equals(:B, 2),
                Payrix::Search.equals(:C, 3),
              ),
              Payrix::Search.and(
                Payrix::Search.equals(:D, 4),
                Payrix::Search.equals(:E, 5),
              ),
            )

        expect(or_.construct).to(
          eq(
            'or[0][and][0][A][equals]=1&' \
            'or[0][and][1][B][equals]=2&' \
            'or[0][and][2][C][equals]=3&' \
            'or[1][and][0][D][equals]=4&' \
            'or[1][and][1][E][equals]=5',
          ),
        )
      end
    end
  end
end
