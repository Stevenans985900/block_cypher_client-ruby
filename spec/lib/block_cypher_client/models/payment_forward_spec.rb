require 'spec_helper'

module BlockCypherClient
  RSpec.describe PaymentForward, type: %i[virtus] do

    describe "attributes" do
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:destination, String) }
      it { is_expected.to have_attribute(:input_address, String) }
      it { is_expected.to have_attribute(:process_fees_address, String) }
      it { is_expected.to have_attribute(:process_fees_satoshis, Integer) }
      it { is_expected.to have_attribute(:process_fees_percent, Float) }
      it { is_expected.to have_attribute(:callback_url, String) }
      it { is_expected.to have_attribute(:enable_confirmations) }
      it { is_expected.to have_attribute(:mining_fees_satoshis, Integer) }
      it { is_expected.to have_attribute(:txs, Array) }
    end

  end
end
