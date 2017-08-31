module BlockCypherClient
  module Bitcoin
    class CreateForwardingAddressResponse < BaseResponse

      attribute(:payment_forward, PaymentForward, {
        default: :default_payment_forward,
        lazy: true,
      })

      private

      def default_payment_forward
        PaymentForward.new(parsed_body)
      end

    end
  end
end
