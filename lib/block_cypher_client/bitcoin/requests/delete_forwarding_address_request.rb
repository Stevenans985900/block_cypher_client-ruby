module BlockCypherClient
  module Bitcoin
    class DeleteForwardingAddressRequest < BaseRequest

      attribute :token, String
      attribute :id, String

      def call
        Typhoeus.delete(url)
      end

      private

      def default_path
        "/v1/#{currency}/#{network}/payments/#{id}"
      end

    end
  end
end
