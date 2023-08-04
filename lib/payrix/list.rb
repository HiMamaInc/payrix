module Payrix
  class List
    include Enumerable

    def initialize(klass:, filters: {}, options: {})
      @klass = klass
      @filters = filters
      @options = options
      @current_page = 0
      @current_data = []
      @more = true

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

        break if !more?
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
      "#<#{self.class}:#{'0x0000%x' % (object_id << 1)} resource=#{@klass} page=#{@current_page} count=#{@current_data.count}>"
    end

    private

    def request_more
      paginate = Payrix::Paginate.construct(@current_page)
      search = Payrix::Search.construct(@filters)
      expand = Payrix::Expand.construct(@options[:expand] || [])
      api_key = @options[:api_key] || Payrix.configuration.api_key

      json, status = Http::Request.instance.send_http(
        'get',
        Payrix.configuration.url,
        "#{@klass::RESOURCE_ENDPOINT}?#{paginate}#{expand}",
        {},
        {
          'Content-Type' => 'application/json',
          'APIKEY' => api_key,
          'SEARCH' => search,
        },
      )

      response = Http::Response.new(json, status, @klass)

      @more = response.has_more?
      @current_data = response.data.map do |resource|
        Payrix::Object.new(resource, @klass.to_s.gsub('Payrix::', ''))
      end

      self
    end
  end
end
