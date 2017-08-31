module BlockCypherClient
  class BaseClient

    DEFAULT_URL = "https://api.blockcypher.com"

    include Virtus.model
    attribute :currency, String
    attribute :network, String
    attribute :token, String
    attribute :domain, String, default: DEFAULT_URL

  end
end
