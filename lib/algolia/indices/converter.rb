require 'yaml'
require 'json'

module Algolia
  module Indices
    class Converter
      def initialize(yaml)
        @yaml = yaml
      end

      def self.load(path)
        self.new(YAML.load_file(path))
      end

      def batch_write_operations_request_paramters
        assemble_batch_write_operations_request_paramters.to_json
      end

      private

      def assemble_batch_write_operations_request_paramters
        records = @yaml['records'].map do |r|
          { 'action' => 'addObject',
            'body' => r}
        end
        { 'requests' => records }
      end
    end
  end
end
