# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Compound do
  describe '#initialize' do
    context 'when the operator is nil' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new(nil, *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is a boolean' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new(true, *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is a number' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new(0, *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is an empty string' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new('', *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is an array' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new([], *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is a hash' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        expect { described_class.new({}, *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is nil' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, true) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is a number' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, 0) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is a string' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, '') }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, {}) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is an empty array' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, []) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is an array of non-search nodes' do
      it 'raises ArgumentError' do
        expect { described_class.new(:operator, [nil, true, 0, '']) }.to raise_error(ArgumentError)
      end
    end

    context 'when the *args is an array of 1 search node' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1)]

        expect { described_class.new(:operator, *nodes) }.to raise_error(ArgumentError)
      end
    end

    context 'when the operator is a string and the *args is an array of 2+ search nodes' do
      it 'instantiates' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new('operator', *nodes)

        expect(compound).to be_a(described_class)
      end
    end

    context 'when the operator is a symbol and the *args is an array of search nodes' do
      it 'instantiates' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect(compound).to be_a(described_class)
      end
    end
  end

  describe '#construct' do
    context 'when the operator is a symbol' do
      it 'returns a valid search argument' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect(compound.construct).to eq('operator[0][A][equals]=1&operator[1][A][equals]=2')
      end
    end

    context 'when the operator is a string' do
      it 'returns a valid search argument' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new('operator', *nodes)

        expect(compound.construct).to eq('operator[0][A][equals]=1&operator[1][A][equals]=2')
      end
    end

    context 'when the prefix is nil' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct(nil) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is a boolean' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct(true) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is a number' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct(0) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is a symbol' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct(:prefix) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is an array' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct([]) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is a hash' do
      it 'raises ArgumentError' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect { compound.construct({}) }.to raise_error(ArgumentError)
      end
    end

    context 'when the prefix is a non-empty string' do
      it 'returns a valid search argument with a prefix' do
        nodes = [Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2)]

        compound = described_class.new(:operator, *nodes)

        expect(compound.construct('prefix')).to(
          eq('prefix[operator][0][A][equals]=1&prefix[operator][1][A][equals]=2'),
        )
      end
    end

    context 'when there are 3 search nodes' do
      it 'returns a valid search argument' do
        nodes = [
          Payrix::Search.equals(:A, 1),
          Payrix::Search.equals(:A, 2),
          Payrix::Search.equals(:A, 3),
        ]

        compound = described_class.new(:operator, *nodes)

        expect(compound.construct).to(
          eq('operator[0][A][equals]=1&operator[1][A][equals]=2&operator[2][A][equals]=3'),
        )
      end
    end

    context 'when there are nested compound nodes' do
      it 'returns a valid search argument' do
        inner_compound1 =
          described_class
            .new(:operator2, Payrix::Search.equals(:A, 1), Payrix::Search.equals(:A, 2))

        inner_compound2 =
          described_class
            .new(:operator2, Payrix::Search.equals(:B, 1), Payrix::Search.equals(:B, 2))

        outer_compound =
          described_class.new(:operator1, inner_compound1, inner_compound2)

        expect(outer_compound.construct).to(
          eq(
            'operator1[0][operator2][0][A][equals]=1&operator1[0][operator2][1][A][equals]=2&' \
            'operator1[1][operator2][0][B][equals]=1&operator1[1][operator2][1][B][equals]=2',
          ),
        )
      end
    end
  end
end
