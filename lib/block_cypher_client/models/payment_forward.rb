module BlockCypherClient
  class PaymentForward

    include Virtus.model
    attribute :id, String
    attribute :token, String
    attribute :destination, String
    attribute :input_address, String
    attribute :process_fees_address, String
    attribute :process_fees_satoshis, Integer
    attribute :process_fees_percent, Float
    attribute :callback_url, String
    attribute :enable_confirmations, Boolean
    attribute :mining_fees_satoshis, Integer
    attribute :txs, Array[String]

  end
end
