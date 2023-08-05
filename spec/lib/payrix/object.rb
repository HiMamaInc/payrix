RSpec.describe Payrix::Object do
  describe '.instantiate_from' do
    context 'when given nil' do
      it 'returns nil' do
        object = described_class.instantiate_from(nil)

        expect(object).to eq(nil)
      end
    end

    context 'when given a number' do
      it 'returns the number' do
        object = described_class.instantiate_from(0)

        expect(object).to eq(0)
      end
    end

    context 'when given a string' do
      it 'returns the string' do
        object = described_class.instantiate_from('')

        expect(object).to eq('')
      end
    end

    context 'when given an empty array' do
      it 'returns the array' do
        object = described_class.instantiate_from([])

        expect(object).to eq([])
      end
    end

    context 'when given an empty hash' do
      it 'returns an object' do
        object = described_class.instantiate_from({})

        expect(object).to be_a(described_class)
      end
    end

    context 'when given a hash with primitive values' do
      it 'returns an object with accessors to values' do
        object = described_class.instantiate_from({
          'id' => 't1_txn_64026b07cc6a79bf5cfd0ca',
          'settledCurrency' => 'USD',
          'settledTotal' => 20000,
          'tax' => nil,
        })

        expect(object.id).to eq('t1_txn_64026b07cc6a79bf5cfd0ca')
        expect(object.settled_currency).to eq('USD')
        expect(object.settled_total).to eq(20000)
        expect(object.tax).to eq(nil)
      end
    end

    context 'when given an array with primitives values' do
      it 'returns the array with values' do
        object = described_class.instantiate_from([nil, 0, ''])

        expect(object).to eq([nil, 0, ''])
      end
    end

    context 'when given an array of hashes' do
      it 'returns the array with accessors to values' do
        object = described_class.instantiate_from([
          {
            'id' => 't1_txn_64026b07cc6a79bf5cfd0ca',
            'settledCurrency' => 'USD',
            'settledTotal' => 20000,
            'tax' => nil,
          },
          {
            'id' => 't1_txn_99326b07cc6a79bf5cfd99c',
            'settledCurrency' => 'CAD',
            'settledTotal' => 17000,
            'tax' => nil,
          },
        ])

        expect(object[0].id).to eq('t1_txn_64026b07cc6a79bf5cfd0ca')
        expect(object[0].settled_currency).to eq('USD')
        expect(object[0].settled_total).to eq(20000)
        expect(object[0].tax).to eq(nil)
        expect(object[1].id).to eq('t1_txn_99326b07cc6a79bf5cfd99c')
        expect(object[1].settled_currency).to eq('CAD')
        expect(object[1].settled_total).to eq(17000)
        expect(object[1].tax).to eq(nil)
      end
    end

    context 'when given a hash with nested hashes' do
      it 'returns an deeply nested objects with deeply nested accessors to values' do
        object = described_class.instantiate_from({
          'id' => 't1_txn_64026b07cc6a79bf5cfd0ca',
          'total' => 10000,
          'merchant' => {
            'id' => 't1_mer_78926b07cc6999dd5cfd0da',
            'lastActivity' => '2023-05-08 16:00:30',
          },
        })

        expect(object.id).to eq('t1_txn_64026b07cc6a79bf5cfd0ca')
        expect(object.total).to eq(10000)
        expect(object.merchant.id).to eq('t1_mer_78926b07cc6999dd5cfd0da')
        expect(object.merchant.last_activity).to eq('2023-05-08 16:00:30')
      end
    end

    context 'when given a hash with nested arrays' do
      it 'returns deeply nested objects with deeply nested accessors to values' do
        object = described_class.instantiate_from({
          'id' => 't1_txn_64026b07cc6a79bf5cfd0ca',
          'entries': [
            {
              'id' => 't1_etr_64cc75f3e946d88ba398bb3',
            },
            {
              'id' => 't1_etr_c8c375f3e946d88ba39bbb8',
            },
          ],
        })

        expect(object.id).to eq('t1_txn_64026b07cc6a79bf5cfd0ca')
        expect(object.entries[0].id).to eq('t1_etr_64cc75f3e946d88ba398bb3')
        expect(object.entries[1].id).to eq('t1_etr_c8c375f3e946d88ba39bbb8')
      end
    end

    context 'when given a hash with nested values of arbitrary depth and complexity' do
      it 'returns deeply nested objects with deeply nested accessors to values' do
        object = described_class.instantiate_from({
          'id' => 't1_txn_64026b07cc6a79bf5cfd0ca',
          'entries': [
            {
              'id' => 't1_etr_64cc75f3e946d88ba398bb3',
              'opposingEntry' => nil,
            },
            {
              'id' => 't1_etr_c8c375f3e946d88ba39bbb8',
              'opposingEntry' => nil,
              'entity' => {
                'id' => 't1_ent_cb139842deb88198bbadbde',
                'type' => 5,
                'payoutSecondaryDescriptor' => 'Deposit',
              },
            },
          ],
          'merchant' => {
            'id' => 't1_mer_78926b07cc6999dd5cfd0da',
          },
        })

        expect(object.id).to eq('t1_txn_64026b07cc6a79bf5cfd0ca')
        expect(object.entries[0].id).to eq('t1_etr_64cc75f3e946d88ba398bb3')
        expect(object.entries[0].opposing_entry).to eq(nil)
        expect(object.entries[1].id).to eq('t1_etr_c8c375f3e946d88ba39bbb8')
        expect(object.entries[1].opposing_entry).to eq(nil)
        expect(object.entries[1].entity.id).to eq('t1_ent_cb139842deb88198bbadbde')
        expect(object.entries[1].entity.type).to eq(5)
        expect(object.entries[1].entity.payout_secondary_descriptor).to eq('Deposit')
        expect(object.merchant.id).to eq('t1_mer_78926b07cc6999dd5cfd0da')
      end
    end
  end
end
