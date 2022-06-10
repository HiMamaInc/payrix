module Payrix
  module Resource
    module Mixin
      module AttrCasters
        def self.included(klass)
          klass.extend(ClassMethods)
        end

        module ClassMethods
          # Use this mixin to dynamically define a getter that casts the specified attribute to an integer. Note that
          # methods are defined (and overridden) in the order they appear, so make sure to use this *after* any
          # additional usage of methods like `.attr_reader` or `.attr_accessor`.
          #
          # In addition to defining a integer-casting getter wrapper around the attribute, it also creates another
          # method, `#{attribute}_raw_value`, which gives the pre-cast value.
          #
          #   class Txns < Base
          #     include Mixin::AttrCasters
          #
          #     def initialize(params)
          #       super(params, [:status, :date, ...])
          #
          #       @resource_name = 'txns'
          #     end
          #
          #     attr_accessor :status, :date, ...
          #     attr_cast_to_integer :status
          #   end
          #
          #   transaction = Txns.new(status: '1')
          #   transaction.status # => 1
          #   transaction.status_raw_value # => "1"
          def attr_cast_to_integer(*attrs)
            attrs.each do |attr|
              define_method(attr) { self.instance_variable_get("@#{attr}").to_i }
              define_method("#{attr}_raw_value") { self.instance_variable_get("@#{attr}") }
            end
          end
        end
      end
    end
  end
end
