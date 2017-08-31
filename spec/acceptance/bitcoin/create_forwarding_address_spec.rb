require 'spec_helper'

RSpec.describe "Bitcoin - create_forwarding_address", vcr: {record: :once} do

  let(:destination) { CONFIG[:bitcoin_test3_addresses][1] }
  let(:callback_url) { "https://callback.com" }

  it "returns the addresses for that page" do
    client = BlockCypherClient.new(
      currency: "btc",
      network: "test3",
      token: CONFIG[:token],
    )

    response = client.create_forwarding_address(destination, {
      callback_url: callback_url,
      mining_fees_satoshis: 70_000,
    })

    expect(response).to be_success
    expect(response.ratelimit_remaining).to be_a Integer

    payment_forward = response.payment_forward
    expect(payment_forward.destination).to eq destination
    expect(payment_forward.id).to be_a String
    expect(payment_forward.token).to eq CONFIG[:token]
    expect(payment_forward.input_address).to be_a String
    expect(payment_forward.callback_url).to eq callback_url
    expect(payment_forward.mining_fees_satoshis).to eq 70_000
  end

end
