require 'ga_measurement_protocol/version'
require 'faraday'
require 'json'

module GaMeasurementProtocol
  # Your code goes here...
  class Client
    attr_reader :conn
    def initialize
      url =
        'https://www.google-analytics.com'

      @conn = Faraday.new(url: url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def post(request)
      JSON.parse(conn.post('/debug/collect', request).body)
    end
  end
end
