# frozen_string_literal: true

module Payrix
  class Txn < BaseResource
    RESOURCE_ENDPOINT = 'txns'

    STATUS_PENDING = 0
    STATUS_APPROVED = 1
    STATUS_FAILED = 2
    STATUS_CAPTURED = 3
    STATUS_SETTLED = 4
    STATUS_RETURNED = 5

    ORIGIN_CREDIT_CARD_TERMINAL = 1
    ORIGIN_ECOMMERCE_SYSTEM = 2
    ORIGIN_MAIL_ORDER = 3
    ORIGIN_APPLE_PAY = 4
    ORIGIN_3D_SECURE_SUCCESSFUL = 5
    ORIGIN_3D_SECURE_ATTEMPTED = 6
    ORIGIN_RECURRING_CARD_TRANSACTION = 7
    ORIGIN_PAYFRAME = 8

    TYPE_SALE_TRANSACTION = 1
    TYPE_AUTH_TRANSACTION = 2
    TYPE_CAPTURE_TRANSACTION = 3
    TYPE_REVERSE_AUTHORIZATION = 4
    TYPE_REFUND_TRANSACTION = 5
    TYPE_ECHECK_SALE_TRANSACTION = 7
    TYPE_ECHECK_REFUND_TRANSACTION = 8
    TYPE_ECHECK_REDEPOSIT_TRANSACTION = 11
    TYPE_ECHECK_ACCOUNT_VERIFICATION_TRANSACTION = 12

    COF_TYPE_SINGLE = 'single'
    COF_TYPE_SCHEDULED = 'scheduled'
    COF_TYPE_UNSCHEDULED = 'unscheduled'

    extend Payrix::APIOperations::DeleteDisabled

    def self.resource_stub
      {
        id: TestAPI.generate_uuid(Txn),
        status: STATUS_APPROVED,
        created: '2025-07-28 09:31:10.2165',
        modified: '2025-07-29 22:00:24.3132',
        creator: TestAPI.generate_uuid(Login),
        modifier: '000000000000001',
        ip_created: '142.198.14.32',
        ip_modified: '142.198.14.32',
        merchant: TestAPI.generate_uuid(Merchant),
        token: 'fe896cce70b841821915950270f33a94',
        payment: TestAPI.generate_uuid(Payment),
        fortxn: nil,
        fromtxn: nil,
        batch: nil,
        subscription: nil,
        type: 7,
        expiration: nil,
        currency: 'USD',
        platform: 'VANTIV',
        auth_date: nil,
        auth_code: nil,
        captured: '2025-07-28 10:05:05',
        settled: 20250728,
        settled_currency: 'USD',
        settled_total: 100200,
        allow_partial: 0,
        order: '0003465',
        description: nil,
        descriptor: 'HM Z',
        terminal: nil,
        terminal_capability: nil,
        entry_mode: nil,
        origin: 2,
        tax: nil,
        total: 100200,
        cashback: nil,
        authorization: nil,
        approved: 100200,
        cvv: 0,
        swiped: 0,
        emv: 0,
        signature: 0,
        unattended: nil,
        client_ip: nil,
        first: '',
        middle: nil,
        last: '',
        company: nil,
        email: nil,
        address1: '123 Main Street',
        address2: '',
        city: 'New York',
        state: 'NH',
        zip: '12345',
        country: nil,
        phone: nil,
        refunded: 0,
        reserved: 0,
        misused: nil,
        imported: 0,
        inactive: 0,
        frozen: 0,
        discount: 0,
        shipping: 0,
        duty: 0,
        pin: 0,
        trace_number: nil,
        cvv_status: nil,
        unauth_reason: nil,
        fee: 200,
        funding_currency: 'USD',
        authentication: nil,
        authentication_id: nil,
        cof_type: nil,
        copy_reason: nil,
        original_approved: 100200,
        currency_conversion: nil,
        service_code: nil,
        auth_token_customer: nil,
        debt_repayment: 0,
        statement: nil,
        convenience_fee: 0,
        surcharge: nil,
        channel: nil,
        funded: 20250729,
        funding_enabled: 1,
        request_sequence: 1,
        processed_sequence: 1,
        mobile: nil,
        pin_entry_capability: nil,
        returned: nil,
        txnsession: nil,
        network_token_indicator: 0,
        soft_pos_device_type_indicator: nil,
        soft_pos_id: nil,
        tip: nil,
        pinless_debit_conversion: nil
      }
    end
  end
end
