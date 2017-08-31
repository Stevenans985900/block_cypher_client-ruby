module BlockCypherClient
  module Bitcoin
    class GetForwardingAddressResponse < BaseResponse

      attribute(:payment_forward, PaymentForward, {
        default: :default_payment_forward,
        lazy: true,
      })

      private

      def default_payment_forward
        PaymentForward.new(parsed_body)
      end

      def default_success
        super && payment_forward.destination.present?
      end

    end
  end
end
