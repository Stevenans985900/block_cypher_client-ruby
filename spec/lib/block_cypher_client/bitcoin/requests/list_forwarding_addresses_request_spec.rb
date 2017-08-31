require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe ListForwardingAddressesRequest, type: %i[virtus] do

      it "is inherits from BlockCypherClient::Bitcoin::BaseRequest" do
        expect(described_class < Bitcoin::BaseRequest).to be true
      end

      describe "attributes" do
        it { is_expected.to have_attribute(:start, Integer).with_default(1) }
        it { is_expected.to have_attribute(:limit, Integer).with_default(200) }
      end

    end
  end
end
