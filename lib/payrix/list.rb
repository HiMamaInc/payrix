module Payrix
  class List
    include Enumerable

    def initialize(klass:, filters: {}, options: {})
      @klass = klass
      @api_key = options[:api_key] || Payrix.configuration.api_key
      @filters = filters
      @options = options
      @search = Payrix::Search.construct(@filters)
      @expand = Payrix::Expand.construct(options[:expand] || [])
      @responses = []
      @response = nil
      @data = []
    end

    def page_forward
      paginate = Payrix::Paginate.construct(next_page)

      json, status = Http::Request.instance.send_http(
        'get',
        Payrix.configuration.url,
        "#{@klass::RESOURCE_ENDPOINT}?#{paginate}#{@expand}",
        {},
        {
          'Content-Type' => 'application/json',
          'APIKEY' => @api_key,
          'SEARCH' => @search,
        },
      )

      @response = Http::Response.new(json, status, @klass)
      @responses.push(@response)
      @data += @response.data.map { |resource| @klass.new(resource) }
    end

    def each(&block)
      @data.each(&block)
    end

    def auto_paging_each(&block)
      loop do
        each(&block)

        if more?
          page_forward
        else
          break
        end
      end
    end

    def auto_paging_map(&block)
      auto_paging_each {}

      map(&block)
    end

    def auto_paging_count
      auto_paging_each {}

      count
    end

    def more?
      @response.nil? ? true : @response.has_more?
    end

    def inspect
      "#<#{self.class}:#{'0x0000%x' % (object_id << 1)} @klass=#{@klass}>"
    end

    private

    def next_page
      return 1 if @response.nil?

      @response.page['current'] + 1
    end
  end
end
