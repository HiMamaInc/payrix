module Payrix
  module Http
    class Response
      attr_reader :status

      def initialize(response = {}, status = '', cls)
        @response = response
        @status = status
        @cls = cls
      end

      # Return the response as an array
      def response
        data = (@response['response'] && @response['response']['data']) || []
        data.map { |v| @cls.new(v) }
      end

      def errors
        @response['errors'] || (@response['response'] && @response['response']['errors']) || []
      end

      def has_errors?
        !errors.empty?
      end

      def details
        (@response['response'] && @response['response']['details']) || {}
      end

      def totals
        (@response['response'] && @response['response']['details'] && @response['response']['details']['totals']) || {}
      end

      def has_more?
        page = @response['response'] && @response['response']['details'] && @response['response']['details']['page']

        !page.nil? &&
        !page['current'].nil? &&
        !page['last'].nil? &&
        page['current'] < page['last']
      end

    end
  end
end
