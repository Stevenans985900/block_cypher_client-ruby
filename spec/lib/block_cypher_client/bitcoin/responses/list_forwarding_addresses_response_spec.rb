require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe ListForwardingAddressesResponse, type: %i[virtus] do

      it "inherits from BlockCypherClient::Bitcoin::BaseResponse" do
        expect(described_class < BlockCypherClient::Bitcoin::BaseResponse).
          to be true
      end

      describe "attributes" do
        it { is_expected.to have_attribute(:payment_forwards, Array) }
      end

      describe "#payment_forward" do
        let(:raw_response) do
          Typhoeus::Response.new(body: [
            {
              input_address: "16uKw7Gs",
              destination: "15qx9ug95",
              callback_url: "https://my.domain.com",
              process_fees_address: "1LWw6FdzN",
              process_fees_percent: 0.1,
              token: "YOURTOKEN",
            }
          ].to_json)
        end
        let(:response) { described_class.new(raw_response: raw_response) }

        it "is the new PaymentForward" do
          payment_forward = response.payment_forwards.first
          expect(payment_forward.input_address).to eq "16uKw7Gs"
          expect(payment_forward.destination).to eq "15qx9ug95"
          expect(payment_forward.callback_url).to eq "https://my.domain.com"
          expect(payment_forward.process_fees_address).to eq "1LWw6FdzN"
          expect(payment_forward.process_fees_percent).to eq 0.1
          expect(payment_forward.token).to eq "YOURTOKEN"
        end
      end

    end
  end
end
