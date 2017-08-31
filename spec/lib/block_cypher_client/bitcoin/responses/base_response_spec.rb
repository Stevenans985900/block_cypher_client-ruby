require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe BaseResponse do

      it "inherits from BlockCypherClient::BaseResponse" do
        expect(described_class < BlockCypherClient::BaseResponse).to be true
      end

    end
  end
end
