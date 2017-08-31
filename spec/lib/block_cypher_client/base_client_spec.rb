require 'spec_helper'

module BlockCypherClient
  RSpec.describe BaseClient, type: %i[virtus] do

    describe "attributes" do
      it { is_expected.to have_attribute(:currency, String) }
      it { is_expected.to have_attribute(:network, String) }
      it { is_expected.to have_attribute(:token, String) }
      it do
        is_expected.to have_attribute(:domain, String).
          with_default(described_class::DEFAULT_URL)
      end
    end

  end
end
