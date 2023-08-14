# frozen_string_literal: true

module Payrix
  class List
    include Enumerable

    def initialize(klass:, filters: {}, options: {})
      @klass = klass
      @filters = filters
      @options = options
      @current_page = options[:page] || 1
      @current_data = []
      @more = true

      if !@current_page.is_a?(Integer) || @current_page < 1
        raise ArgumentError, 'Page option must be an integer greater than 0'
      end

      @current_page -= 1

      page_forward
    end

    def page_forward
      @current_page += 1

      request_more
    end

    def page_backward
      @current_page = [@current_page - 1, 1].max

      request_more
    end

    def each(&block)
      @current_data.each(&block)
    end

    def auto_paging_each(&block)
      @current_page = 0

      loop do
        page_forward
        each(&block)

        break unless more?
      end
    end

    def auto_paging_map(&block)
      collector = []

      auto_paging_each { |record| collector.push(block.call(record)) }

      collector
    end

    def auto_paging_count
      count = 0

      auto_paging_each { count += 1 }

      count
    end

    def more?
      @more
    end

    def inspect
      "#<#{self.class}:#{format('0x0000%x', (object_id << 1))} page=#{@current_page} count=#{@current_data.count}>"
    end

    private

    def request_more
      response =
        Payrix::Util.get(
          klass: @klass,
          filters: @filters,
          options: @options.merge(page: @current_page),
        )

      @more = response.more?
      @current_data = Payrix::Object.instantiate_from(response.data)

      self
    end
  end
end
