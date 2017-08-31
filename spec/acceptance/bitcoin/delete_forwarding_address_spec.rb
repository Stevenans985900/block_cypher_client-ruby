require 'spec_helper'

RSpec.describe "Bitcoin - delete_forwarding_address", vcr: {record: :once} do

  let(:destination) { CONFIG[:bitcoin_test3_addresses][1] }
  let(:callback_url) { "https://callback.com" }

  it "returns the addresses for that page" do
    client = BlockCypherClient.new(
      currency: "btc",
      network: "test3",
      token: CONFIG[:token],
    )

    create_response = client.create_forwarding_address(destination)

    expect(create_response).to be_success

    id = create_response.payment_forward.id
    delete_response = client.delete_forwarding_address(id)

    expect(delete_response).to be_success

    get_response = client.get_forwarding_address(id)
    expect(get_response).to_not be_success
  end

end
