# frozen_string_literal: true

RSpec.describe Payrix::Util do
  describe '.camel_case' do
    context 'when given a snake-cased string' do
      it 'converts the string to camel case' do
        expect(described_class.camel_case('a_string_value')).to eq('aStringValue')
      end
    end

    context 'when given a camel-cased string' do
      it 'maintains the camel casing' do
        expect(described_class.camel_case('aStringValue')).to eq('aStringValue')
      end
    end
  end

  describe '.snake_case' do
    context 'when given a camel-cased string' do
      it 'converts the string to snake case' do
        expect(described_class.snake_case('aStringValue')).to eq('a_string_value')
      end
    end

    context 'when given a snake-cased string' do
      it 'maintains the snake casing' do
        expect(described_class.snake_case('a_string_value')).to eq('a_string_value')
      end
    end
  end

  describe '.recursive_snake_case' do
    context 'when given nil' do
      it 'returns nil' do
        object = nil

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to be_nil
      end
    end

    context 'when given a boolean' do
      it 'returns the boolean' do
        object = true

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to be(true)
      end
    end

    context 'when given a number' do
      it 'returns the number' do
        object = 0

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to be(0)
      end
    end

    context 'when given a string' do
      it 'returns the string' do
        object = ''

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to eq('')
      end
    end

    context 'when given a symbol' do
      it 'returns the symbol' do
        object = :symbol

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to eq(:symbol)
      end
    end

    context 'when given an empty hash' do
      it 'returns the hash' do
        object = {}

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to eq({})
      end
    end

    context 'when given an empty array' do
      it 'returns the empty array' do
        object = []

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to eq([])
      end
    end

    context 'when given a hash with camel-cased keys and primitive values' do
      it 'returns the hash with keys transformed into snake-cased strings' do
        object = {
          aField: nil,
          bField: true,
          cField: 0,
          dField: '',
          eField: :symbol,
        }

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to(
          eq(
            'a_field' => nil,
            'b_field' => true,
            'c_field' => 0,
            'd_field' => '',
            'e_field' => :symbol,
          ),
        )
      end
    end

    context 'when given a hash with camel-cased keys nested hashes' do
      it 'returns the hash (and nested hashes) with keys transformed into snake-cased strings' do
        object = {
          aField: {
            bField: {
              cField: 'value',
            },
          },
        }

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to(
          eq(
            'a_field' => {
              'b_field' => {
                'c_field' => 'value',
              },
            },
          ),
        )
      end
    end

    context 'when given a hash with snake-cased keys and primitive values' do
      it 'returns the hash with keys maintained as snake-cased strings' do
        object = {
          a_field: nil,
          b_field: true,
          c_field: 0,
          d_field: '',
          e_field: :symbol,
        }

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to(
          eq(
            'a_field' => nil,
            'b_field' => true,
            'c_field' => 0,
            'd_field' => '',
            'e_field' => :symbol,
          ),
        )
      end
    end

    context 'when given a hash with snake-cased keys nested hashes' do
      it 'returns the hash (and nested hashes) with keys maintained as snake-cased strings' do
        object = {
          a_field: {
            b_field: {
              c_field: 'value',
            },
          },
        }

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to(
          eq(
            'a_field' => {
              'b_field' => {
                'c_field' => 'value',
              },
            },
          ),
        )
      end
    end

    context 'when given an array with primitive values' do
      it 'returns the array with primitive values' do
        object = [nil, true, 0, '', :symbol]

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to eq([nil, true, 0, '', :symbol])
      end
    end

    context 'when given an array of hashes' do
      it 'returns the array of hashes with keys transformed into snaked-cased strings' do
        object = [
          {
            aField: 0,
          },
          {
            bField: 1,
          },
        ]

        transformed = described_class.recursive_snake_case(object)

        expect(transformed).to(
          eq(
            [
              {
                'a_field' => 0,
              },
              {
                'b_field' => 1,
              },
            ],
          ),
        )
      end
    end
  end

  describe '.recursive_camel_case' do
    context 'when given nil' do
      it 'returns nil' do
        object = nil

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to be_nil
      end
    end

    context 'when given a boolean' do
      it 'returns the boolean' do
        object = true

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to be(true)
      end
    end

    context 'when given a number' do
      it 'returns the number' do
        object = 0

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to be(0)
      end
    end

    context 'when given a string' do
      it 'returns the string' do
        object = ''

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to eq('')
      end
    end

    context 'when given a symbol' do
      it 'returns the symbol' do
        object = :symbol

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to eq(:symbol)
      end
    end

    context 'when given an empty hash' do
      it 'returns the hash' do
        object = {}

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to eq({})
      end
    end

    context 'when given an empty array' do
      it 'returns the empty array' do
        object = []

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to eq([])
      end
    end

    context 'when given a hash with snake-cased keys and primitive values' do
      it 'returns the hash with keys transformed into camel-cased strings' do
        object = {
          a_field: nil,
          b_field: true,
          c_field: 0,
          d_field: '',
          e_field: :symbol,
        }

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to(
          eq(
            'aField' => nil,
            'bField' => true,
            'cField' => 0,
            'dField' => '',
            'eField' => :symbol,
          ),
        )
      end
    end

    context 'when given a hash with snake-cased keys nested hashes' do
      it 'returns the hash (and nested hashes) with keys transformed into camel-cased strings' do
        object = {
          a_field: {
            b_field: {
              c_field: 'value',
            },
          },
        }

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to(
          eq(
            'aField' => {
              'bField' => {
                'cField' => 'value',
              },
            },
          ),
        )
      end
    end

    context 'when given a hash with camel-cased keys and primitive values' do
      it 'returns the hash with keys maintained as camel-cased strings' do
        object = {
          aField: nil,
          bField: true,
          cField: 0,
          dField: '',
          eField: :symbol,
        }

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to(
          eq(
            'aField' => nil,
            'bField' => true,
            'cField' => 0,
            'dField' => '',
            'eField' => :symbol,
          ),
        )
      end
    end

    context 'when given a hash with camel-cased keys nested hashes' do
      it 'returns the hash (and nested hashes) with keys maintained as camel-cased strings' do
        object = {
          aField: {
            bField: {
              cField: 'value',
            },
          },
        }

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to(
          eq(
            'aField' => {
              'bField' => {
                'cField' => 'value',
              },
            },
          ),
        )
      end
    end

    context 'when given an array with primitive values' do
      it 'returns the array with primitive values' do
        object = [nil, true, 0, '', :symbol]

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to eq([nil, true, 0, '', :symbol])
      end
    end

    context 'when given an array of hashes' do
      it 'returns the array of hashes with keys transformed into camel-cased strings' do
        object = [
          {
            a_field: 0,
          },
          {
            b_field: 1,
          },
        ]

        transformed = described_class.recursive_camel_case(object)

        expect(transformed).to(
          eq(
            [
              {
                'aField' => 0,
              },
              {
                'bField' => 1,
              },
            ],
          ),
        )
      end
    end
  end
end
