require 'spec_helper'

module BlockCypherClient
  RSpec.describe BitcoinClient, type: %i[virtus] do

    it "inherits from BaseClient" do
      expect(described_class < BaseClient).to be true
    end

  end
end
