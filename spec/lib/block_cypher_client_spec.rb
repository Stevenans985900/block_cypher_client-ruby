require 'spec_helper'

RSpec.describe BlockCypherClient do

  describe ".new" do
    context "given Bitcoin settings" do
      it "instantiates a BlockCypherClient::BitcoinClient" do
        client = described_class.new(
          currency: "btc",
          network: "test3",
          token: "123",
        )

        expect(client).to be_a described_class::BitcoinClient
        expect(client.currency).to eq "btc"
        expect(client.network).to eq "test3"
        expect(client.token).to eq "123"
      end
    end

    context "given unknown currency" do
      it "raises an error" do
        expect do
          described_class.new(currency: "xyz", network: "123", token: "321")
        end.to raise_error(
          ArgumentError,
          "unknown currency `xyz`. " \
          "Must be one of #{described_class::CURRENCY_NETWORKS.keys.join(", ")}"
        )
      end
    end

    context "given known currency but unknown network" do
      it "raises an error" do
        expect do
          described_class.new(currency: "btc", network: "123", token: "321")
        end.to raise_error(
          ArgumentError,
          "unknown network `123` for currency `btc`. " \
          "Must be one of #{described_class::CURRENCY_NETWORKS["btc"].join(", ")}"
        )
      end
    end
  end

end
