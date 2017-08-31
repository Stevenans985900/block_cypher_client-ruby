require 'spec_helper'

module BlockCypherClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      it { is_expected.to have_attribute(:currency, String) }
      it { is_expected.to have_attribute(:network, String) }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:domain, String) }
      it { is_expected.to have_attribute(:path, String) }
      it { is_expected.to have_attribute(:url, String) }
    end

    describe "#url" do
      let(:request) do
        described_class.new(domain: "https://mydomain.com/", path: "/api/v1/hi")
      end

      it "is the combination of the domain + path" do
        expect(request.url).to eq "https://mydomain.com/api/v1/hi"
      end
    end

    describe "#path" do
      it "takes its value from `default_path`" do
        klass = Class.new(described_class) do
          def default_path
            "/hi"
          end
        end

        request = klass.new(domain: "https://go.com")

        expect(request.url).to eq "https://go.com/hi"
      end
    end

  end
end
