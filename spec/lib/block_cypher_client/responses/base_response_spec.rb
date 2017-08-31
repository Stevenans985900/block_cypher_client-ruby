require 'spec_helper'

module BlockCypherClient
  RSpec.describe BaseResponse, type: %i[virtus] do

    describe "attributes" do
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:success) }
      it { is_expected.to have_attribute(:parsed_body) }
      it { is_expected.to have_attribute(:parsed_body) }
      it { is_expected.to have_attribute(:ratelimit_remaining, Integer) }
    end

    describe "#success?" do
      let(:raw_response) do
        Typhoeus::Response.new(response_code: response_code, return_code: :ok)
      end
      let(:response) { described_class.new(raw_response: raw_response) }
      subject { response.success? && response.success }

      context "successful raw_response" do
        let(:response_code) { 201 }
        it { is_expected.to be true }
      end

      context "unsuccessful raw_response" do
        let(:response_code) { 404 }
        it { is_expected.to be false }
      end
    end

    describe "#parsed_body" do
      let(:raw_response) do
        Typhoeus::Response.new(body: body)
      end
      let(:response) { described_class.new(raw_response: raw_response) }
      subject(:parsed_body) { response.parsed_body }

      context "body is a json hash" do
        let(:body) { %Q({"hi": "there"}) }

        it "is the parsed body" do
          expect(parsed_body[:hi]).to eq "there"
        end
      end

      context "body is a json array" do
        let(:body) { %Q([{"hi": "there"}]) }

        it "is the parsed body" do
          expect(parsed_body.first[:hi]).to eq "there"
        end
      end
    end

    describe "#ratelimit_remaining" do
      let(:raw_response) do
        Typhoeus::Response.new(headers: {"X-Ratelimit-Remaining" => 212})
      end
      let(:response) { described_class.new(raw_response: raw_response) }

      it "is X-Ratelimit-Remaining in the headers" do
        expect(response.ratelimit_remaining).to eq 212
      end
    end

  end
end
