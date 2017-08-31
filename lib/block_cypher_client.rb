require "typhoeus"
require "virtus"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/blank"
require "block_cypher_client/version"
require "block_cypher_client/base_client"
require "block_cypher_client/models/payment_forward"
require "block_cypher_client/requests/base_request"
require "block_cypher_client/responses/base_response"
require "block_cypher_client/bitcoin_client"
require "block_cypher_client/bitcoin/requests/base_request"
require "block_cypher_client/bitcoin/requests/list_forwarding_addresses_request"
require "block_cypher_client/bitcoin/requests/create_forwarding_address_request"
require "block_cypher_client/bitcoin/requests/get_forwarding_address_request"
require "block_cypher_client/bitcoin/requests/delete_forwarding_address_request"
require "block_cypher_client/bitcoin/responses/base_response"
require "block_cypher_client/bitcoin/responses/list_forwarding_addresses_response"
require "block_cypher_client/bitcoin/responses/create_forwarding_address_response"
require "block_cypher_client/bitcoin/responses/get_forwarding_address_response"
require "block_cypher_client/bitcoin/responses/delete_forwarding_address_response"

module BlockCypherClient
  CURRENCY_NETWORKS = {
    "btc" => %w(main test3),
    "doge" => %w(main),
    "ltc" => %w(main),
    "bcy" => %w(test),
  }

  def self.new(currency:, network:, token:)
    if !CURRENCY_NETWORKS.keys.include?(currency)
      raise(
        ArgumentError,
        "unknown currency `#{currency}`. " \
        "Must be one of #{CURRENCY_NETWORKS.keys.join(", ")}"
      )
    end

    if !CURRENCY_NETWORKS[currency].include?(network)
      raise(
        ArgumentError,
        "unknown network `#{network}` for currency `#{currency}`. " \
        "Must be one of #{CURRENCY_NETWORKS[currency].join(", ")}"
      )
    end

    # NOTE: do not need other clients until we implement new APIs like Ethereum
    BitcoinClient.new(
      currency: currency,
      network: network,
      token: token,
    )
  end
end
