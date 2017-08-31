require 'spec_helper'

RSpec.describe "Bitcoin - list_forwarding_addresses", vcr: {record: :once} do

  let(:client) do
    BlockCypherClient.new(
      currency: "btc",
      network: "test3",
      token: CONFIG[:token],
    )
  end

  it "returns the addresses for that page" do
    addresses = CONFIG[:bitcoin_test3_addresses][0..2]

    addresses.each do |destination|
      client.create_forwarding_address(destination)
    end

    response = client.list_forwarding_addresses(start: 1, limit: 2)

    expect(response).to be_success
    payment_forwards = response.payment_forwards
    expect(payment_forwards.size).to eq 2

    client.list_forwarding_addresses(start: 3, limit: 2)
    expect(response).to be_success
    payment_forwards = response.payment_forwards
    expect(payment_forwards.size >= 1).to be true
  end

end
