module BlockCypherClient
  module Bitcoin
    class ListForwardingAddressesRequest < BaseRequest

      attribute :start, Integer, lazy: true, default: 1
      attribute :limit, Integer, lazy: true, default: 200

      def call
        Typhoeus.get(url, {
          params: { start: start, limit: limit, token: token },
        })
      end

      def default_path
        "/v1/#{currency}/#{network}/payments"
      end

    end
  end
end
