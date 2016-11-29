require 'ga_measurement_protocol/version'
require 'faraday'
require 'json'

module GaMeasurementProtocol
  class Client
    attr_reader :conn
    def initialize(debug: false)
      @debug = debug
      url =
        'https://www.google-analytics.com'

      @conn = Faraday.new(url: url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def post(request)
      url = if debug?
              '/debug/collect'
            else
              '/collect'
            end
      JSON.parse(conn.post(url, request).body)
    end

    def debug?
      @debug
    end
  end
end
