module BlockCypherClient
  class BitcoinClient < BaseClient

    MAX_FORWARDING_ADDRESSES_PER_PAGE = 200

    def create_forwarding_address(destination, opts={})
      request_opts = default_opts.merge(destination: destination).merge(opts)
      request = Bitcoin::CreateForwardingAddressRequest.new(request_opts)
      raw_response = request.()
      Bitcoin::CreateForwardingAddressResponse.new(raw_response: raw_response)
    end

    def get_forwarding_address(id)
      request_opts = default_opts.merge(id: id)
      request = Bitcoin::GetForwardingAddressRequest.new(request_opts)
      raw_response = request.()
      Bitcoin::GetForwardingAddressResponse.new(raw_response: raw_response)
    end

    def delete_forwarding_address(id)
      request_opts = default_opts.merge(id: id)
      request = Bitcoin::DeleteForwardingAddressRequest.new(request_opts)
      raw_response = request.()
      Bitcoin::DeleteForwardingAddressResponse.new(raw_response: raw_response)
    end

    def list_forwarding_addresses(
      start: 1,
      limit: MAX_FORWARDING_ADDRESSES_PER_PAGE
    )
      request_opts = default_opts.merge(start: start, limit: limit)
      request = Bitcoin::ListForwardingAddressesRequest.new(request_opts)
      raw_response = request.()
      Bitcoin::ListForwardingAddressesResponse.new(raw_response: raw_response)
    end

    def list_all_forwarding_addresses(limit: MAX_FORWARDING_ADDRESSES_PER_PAGE)
      cursor = 1
      inserted_ids = []
      payment_forwards = {}

      loop do
        inserted_any = false
        response = list_forwarding_addresses(start: cursor, limit: limit)

        cursor += response.payment_forwards.size

        response.payment_forwards.each do |payment_forward|
          next payment_forward if payment_forwards[payment_forward.id]
          payment_forwards[payment_forward.id] = payment_forward
          inserted_any = true
        end

        break if !inserted_any
      end

      payment_forwards.values
    end

    private

    def default_opts
      %i[currency network token domain].each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
