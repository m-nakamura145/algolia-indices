RSpec.describe Algolia::Indices::Client do
  let(:api_key) do
    'api_key'
  end
  let(:application_id) do
    'application_id'
  end
  let(:index_name) do
    'index_name'
  end
  let(:client) do
    Algolia::Indices::Client.new(api_key, application_id, index_name)
  end

  describe '#request_headers' do
    subject do
      client.send(:request_headers)
    end

    it 'returns request_headers' do
      expect(subject).to eq({
                                'X-Algolia-API-Key' => api_key,
                                'X-Algolia-Application-Id' => application_id
                            })
    end
  end

  describe '#algolia_api_base_url' do
    subject do
      client.send(:algolia_api_base_url)
    end

    it { expect(subject).to eq("https://#{application_id}.algolia.net") }
  end

  describe '#batch_write_operations_path' do
    subject do
      client.send(:batch_write_operations_path)
    end

    it { expect(subject).to eq("/1/indexes/#{index_name}/batch") }
  end

  describe '#clear_index_path' do
    subject do
      client.send(:clear_index_path)
    end

    it { expect(subject).to eq("/1/indexes/#{index_name}/clear") }
  end
end
