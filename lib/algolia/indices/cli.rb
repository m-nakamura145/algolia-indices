require 'thor'
require 'algolia/indices/client'
require 'algolia/indices/converter'

module Algolia
  module Indices
    class CLI < Thor
      desc "import [API-KEY] [APPLICATION-ID] [INDEX-NAME] [FILE-PATH]", "import records to specified Algolia index"
      def import(api_key, application_id, index_name, path)
        puts 'Import records to Algolia'
        converter = Algolia::Indices::Converter.load(path)
        client = Algolia::Indices::Client.new(api_key, application_id, index_name)
        client.batch_write_operations(converter.batch_write_operations_request_paramters)
        puts 'Finished'
      end
    end
  end
end
