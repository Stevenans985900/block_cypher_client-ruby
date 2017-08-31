require 'spec_helper'

RSpec.describe "Bitcoin - list_all_forwarding_addresses", vcr: {record: :once} do

  let(:client) do
    BlockCypherClient.new(
      currency: "btc",
      network: "test3",
      token: CONFIG[:token],
    )
  end

  before do
    # Clean up the remote server. NOTE: you do not want to use a production key!
    client.list_all_forwarding_addresses.each do |payment_forward|
      client.delete_forwarding_address(payment_forward.id)
    end
  end

  it "returns the all the addresses" do

    addresses = CONFIG[:bitcoin_test3_addresses][0..2]

    addresses.each do |destination|
      client.create_forwarding_address(destination)
    end

    payment_forwards = client.list_all_forwarding_addresses(limit: 2)

    expect(payment_forwards.size > 3).to be true
  end

end
