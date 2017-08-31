module BlockCypherClient
  module Bitcoin
    class GetForwardingAddressRequest < BaseRequest

      attribute :id, String

      def call
        Typhoeus.get(url)
      end

      private

      def default_path
        "/v1/#{currency}/#{network}/payments/#{id}"
      end

    end
  end
end
