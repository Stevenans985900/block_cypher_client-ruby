module BlockCypherClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response
    attribute :success, Boolean, lazy: true, default: :default_success
    attribute :parsed_body, Object, lazy: true, default: :default_parsed_body
    attribute(:ratelimit_remaining, Integer, {
      lazy: true,
      default: :default_ratelimit_remaining,
    })

    private

    def default_success
      raw_response.success?
    end

    def default_parsed_body
      parsed = JSON.parse(raw_response.body)
      if parsed.is_a?(Array)
        parsed.map(&:with_indifferent_access)
      else
        parsed.with_indifferent_access
      end
    end

    def default_ratelimit_remaining
      raw_response.headers["X-Ratelimit-Remaining"]
    end

  end
end
