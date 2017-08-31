require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe DeleteForwardingAddressResponse, type: %i[virtus] do

      it "inherits from BlockCypherClient::Bitcoin::BaseResponse" do
        expect(described_class < BlockCypherClient::Bitcoin::BaseResponse).
          to be true
      end

    end
  end
end
