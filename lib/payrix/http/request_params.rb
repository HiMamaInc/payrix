module Payrix
  module Http
    class RequestParams
      def initialize(sort = '', expand = [], page = 1, totals = {})
        self.sort = sort
        self.expand = expand
        self.page = page
        self.totals = totals
      end

      def sort
        @sort
      end

      def sort=(sort)
        if sort.is_a?(Array) && sort.size == 2
          @sort = "#{sort[0]}[sort]=#{sort[1]}"
        else
          @sort = sort
        end
      end

      def expand
        @expand.map do |s|
          fields = s.split(',').map { |field| "[#{field.strip}]" }
          "expand#{fields.join}[]"
        end.join('&')
      end

      def expand=(expand)
        if expand.is_a?(Array)
          @expand = expand
        end
      end

      # Retrieve the totals header string
      def totals
        @totals.map do |action, values|
          if values.is_a?(Array) && !values.empty?
            values.map do |value|
              "#{action}[]=#{value}"
            end
          end
        end.join('&')
      end

      # Set the totals hash
      def totals=(totals)
        if totals.is_a?(Hash)
          @totals = totals
        end
      end

      def page
        @page.nil? || @page == 0 ? "" : "page[number]=#{@page}"
      end

      def page=(page)
        @page = page
      end

      def go_next_page
        @page = @page.nil? || @page == 0 ? 1 : @page + 1
      end
    end
  end
end
