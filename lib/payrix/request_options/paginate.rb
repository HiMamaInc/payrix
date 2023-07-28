module Payrix
  module Paginate
    def self.construct(page)
      "page[number]=#{page}&"
    end
  end
end
