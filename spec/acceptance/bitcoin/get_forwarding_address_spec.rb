require 'spec_helper'

RSpec.describe "Bitcoin - get_forwarding_address", vcr: {record: :once} do

  let(:client) do
    BlockCypherClient.new(
      currency: "btc",
      network: "test3",
      token: CONFIG[:token],
    )
  end
  let(:destination) { CONFIG[:bitcoin_test3_addresses][1] }

  it "returns the addresses for that page" do
    create_response = client.create_forwarding_address(destination)

    expect(create_response).to be_success

    id = create_response.payment_forward.id
    response = client.get_forwarding_address(id)

    expect(response).to be_success
    expect(response.payment_forward.id).to eq id
    expect(response.payment_forward.destination).to eq destination
  end

end
