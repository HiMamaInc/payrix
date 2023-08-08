# frozen_string_literal: true

RSpec.describe Payrix::RequestOptions::Search::Atom do
  describe '#initialize' do
    context 'when the field is nil' do
      it 'raises ArgumentError' do
        expect { described_class.new(nil, :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the field is a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.new(true, :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the field is a number' do
      it 'raises ArgumentError' do
        expect { described_class.new(0, :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the field is a symbol' do
      it 'instantiates' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom).to be_a(described_class)
      end
    end

    context 'when the field is an empty string' do
      it 'raises ArgumentError' do
        expect { described_class.new('', :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the field is a non-empty string' do
      it 'instantiates' do
        atom = described_class.new('field', :operator, 'value')

        expect(atom).to be_a(described_class)
      end
    end

    context 'when the field is an array' do
      it 'raises ArgumentError' do
        expect { described_class.new([], :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the field is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.new({}, :operator, 'value') }.to(
          raise_error(ArgumentError, 'Field parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is nil' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, nil, 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, true, 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is a number' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, 0, 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is a symbol' do
      it 'instantiates' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom).to be_a(described_class)
      end
    end

    context 'when the operator is an empty string' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, '', 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is a non-empty string' do
      it 'instantiates' do
        atom = described_class.new(:field, 'operator', 'value')

        expect(atom).to be_a(described_class)
      end
    end

    context 'when the operator is an array' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, [], 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the operator is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, {}, 'value') }.to(
          raise_error(ArgumentError, 'Operator parameter must be a symbol or a non-empty string'),
        )
      end
    end

    context 'when the value is nil' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, nil) }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end

    context 'when the value is a boolean' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, true) }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end

    context 'when the value is a number' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, 0) }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end

    context 'when the value is an empty string' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, '') }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end

    context 'when the value is a non-empty string' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom).to be_a(described_class)
      end
    end

    context 'when the value is an array' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, []) }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end

    context 'when the value is a hash' do
      it 'raises ArgumentError' do
        expect { described_class.new(:field, :operator, {}) }.to(
          raise_error(ArgumentError, 'Value parameter must be a non-empty string'),
        )
      end
    end
  end

  describe '#construct' do
    context 'when the field is a symbol' do
      it 'returns a valid search argument' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom.construct).to eq('field[operator]=value')
      end
    end

    context 'when the field is a snake-cased symbol' do
      it 'camel-cases the field and returns a valid search argument' do
        atom = described_class.new(:a_field, :operator, 'value')

        expect(atom.construct).to eq('aField[operator]=value')
      end
    end

    context 'when the field is a camel-cased symbol' do
      it 'maintains the camel-casing and returns a valid search argument' do
        atom = described_class.new(:aField, :operator, 'value')

        expect(atom.construct).to eq('aField[operator]=value')
      end
    end

    context 'when the field is a string' do
      it 'returns a valid search argument' do
        atom = described_class.new('field', :operator, 'value')

        expect(atom.construct).to eq('field[operator]=value')
      end
    end

    context 'when the field is a snake-cased string' do
      it 'camel-cases the field and returns a valid search argument' do
        atom = described_class.new('a_field', :operator, 'value')

        expect(atom.construct).to eq('aField[operator]=value')
      end
    end

    context 'when the field is a camel-cased string' do
      it 'maintains the camel-casing and returns a valid search argument' do
        atom = described_class.new('aField', :operator, 'value')

        expect(atom.construct).to eq('aField[operator]=value')
      end
    end

    context 'when the operator is a symbol' do
      it 'returns a valid search argument' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom.construct).to eq('field[operator]=value')
      end
    end

    context 'when the operator is a string' do
      it 'returns a valid search argument' do
        atom = described_class.new(:field, 'operator', 'value')

        expect(atom.construct).to eq('field[operator]=value')
      end
    end

    context 'when the prefix is nil' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct(nil) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end

    context 'when the prefix is a boolean' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct(true) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end

    context 'when the prefix is a number' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct(0) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end

    context 'when the prefix is a symbol' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct(:prefix) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end

    context 'when the prefix is a non-empty string' do
      it 'returns a valid search argument with a prefix' do
        atom = described_class.new(:field, :operator, 'value')

        expect(atom.construct('prefix')).to eq('prefix[field][operator]=value')
      end
    end

    context 'when the prefix is an array' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct([]) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end

    context 'when the prefix is a hash' do
      it 'raises ArgumentError' do
        atom = described_class.new(:field, :operator, 'value')

        expect { atom.construct({}) }.to(
          raise_error(ArgumentError, 'Prefix parameter must be a string'),
        )
      end
    end
  end
end
