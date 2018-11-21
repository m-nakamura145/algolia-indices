require 'json'
require 'faraday'

module Algolia
  module Indices
    class Client
      def initialize(api_key, application_id, index_name)
        @api_key = api_key
        @application_id = application_id
        @index_name = index_name
        http_client
      end

      def batch_write_operations(parameters)
        http_post(batch_write_operations_path, parameters)
      end

      def clear_index
        http_post(clear_index_path)
      end

      private

      def http_client
        @http_client ||= ::Faraday.new(
            url: algolia_api_base_url,
            headers: request_headers
        ) do |faraday|
          faraday.response(:raise_error)
          faraday.adapter(::Faraday.default_adapter)
        end
      end

      def request_headers
        {
            'X-Algolia-API-Key' => @api_key,
            'X-Algolia-Application-Id' => @application_id
        }
      end

      def http_post(path, parameters = {}.to_json)
        http_client.post do |req|
          req.url path
          req.body = parameters
        end
      end

      def algolia_api_base_url
        "https://#{@application_id}.algolia.net"
      end

      def batch_write_operations_path
        "/1/indexes/#{@index_name}/batch"
      end

      def clear_index_path
        "/1/indexes/#{@index_name}/clear"
      end
    end
  end
end
