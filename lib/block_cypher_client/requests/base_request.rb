module BlockCypherClient
  class BaseRequest

    include Virtus.model
    attribute :currency, String
    attribute :network, String
    attribute :token, String
    attribute :domain, String
    attribute :path, String, lazy: true, default: :default_path
    attribute :url, String, lazy: true, default: :default_url

    private

    def default_url
      uri = URI.parse(domain)
      uri.path = path
      uri.to_s
    end

  end
end
