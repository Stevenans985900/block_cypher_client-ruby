require 'spec_helper'

module BlockCypherClient
  module Bitcoin
    RSpec.describe DeleteForwardingAddressRequest, type: %i[virtus] do

      it "inherits from #{Bitcoin::BaseRequest}" do
        expect(described_class < Bitcoin::BaseRequest).to be true
      end

      describe "attributes" do
        it { is_expected.to have_attribute(:id, String) }
      end

    end
  end
end
