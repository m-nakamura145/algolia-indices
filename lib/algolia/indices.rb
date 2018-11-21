require 'algolia/indices/version'
require 'algolia/indices/cli'

module Algolia
  module Indices
    class Importer
      def initialize(api_key, application_id, index_name, path)
        @path = path
        @algolia_client = Client.new(api_key, application_id, index_name)
      end
    end
  end
end


