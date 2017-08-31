module BlockCypherClient
  module Bitcoin
    class CreateForwardingAddressRequest < BaseRequest

      attribute :token, String
      attribute :destination, String
      attribute :input_address, String
      attribute :process_fees_address, String
      attribute :process_fees_satoshis, Integer
      attribute :process_fees_percent, Float
      attribute :callback_url, String
      attribute :enable_confirmations, Boolean
      attribute :mining_fees_satoshis, Integer

      def call
        Typhoeus.post(url, {
          body: body,
        })
      end

      private

      def body
        %i[
          token
          destination
          input_address
          process_fees_address
          process_fees_satoshis
          process_fees_percent
          callback_url
          enable_confirmations
          mining_fees_satoshis
        ].each_with_object({}) do |attr, hash|
          hash[attr] = send(attr)
        end.to_json
      end

      def default_path
        "/v1/#{currency}/#{network}/payments"
      end

    end
  end
end
