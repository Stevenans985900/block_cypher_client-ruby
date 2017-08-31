module BlockCypherClient
  module Bitcoin
    class ListForwardingAddressesResponse < BaseResponse

      attribute(:payment_forwards, Array[PaymentForward], {
        default: :default_payment_forwards,
        lazy: true,
      })

      private

      def default_payment_forwards
        parsed_body.map do |hash|
          PaymentForward.new(hash)
        end
      end

    end
  end
end
