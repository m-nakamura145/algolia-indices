require 'thor'
require 'algolia/indices/client'
require 'algolia/indices/converter'

module Algolia
  module Indices
    class CLI < Thor
      desc 'import [API-KEY] [APPLICATION-ID] [INDEX-NAME] [FILE-PATH]', 'Import records to specified algolia index'
      def import(api_key, application_id, index_name, path)
        puts 'Import records to Algolia'
        converter = Algolia::Indices::Converter.load(path)
        client = Algolia::Indices::Client.new(api_key, application_id, index_name)
        client.batch_write_operations(converter.batch_write_operations_request_paramters)
        puts 'Finished'
      end

      desc 'clear [API-KEY] [APPLICATION-ID] [INDEX-NAME]', 'Clear records from specified algolia index'
      def clear(api_key, application_id, index_name)
        puts "Clear an index: #{index_name} content"
        client = Algolia::Indices::Client.new(api_key, application_id, index_name)
        client.clear_index
        puts 'Finished'
      end
    end
  end
end
