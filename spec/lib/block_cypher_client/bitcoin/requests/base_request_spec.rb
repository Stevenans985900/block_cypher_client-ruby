require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe BaseRequest do

      it "inherits from BlockCypherClient::BaseRequest" do
        expect(described_class < BlockCypherClient::BaseRequest).to be true
      end

    end
  end
end
