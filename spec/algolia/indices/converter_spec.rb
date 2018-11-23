RSpec.describe Algolia::Indices::Converter do
  let(:yaml) do
    {'records' => [{'name' => 'taro'}, {'name' => 'tom'}]}
  end
  let(:converter) do
    Algolia::Indices::Converter.new(yaml)
  end
  describe '#assemble_batch_write_operations_request_paramters' do
    subject do
      converter.send(:assemble_batch_write_operations_request_paramters)
    end

    it 'returns request_parameters' do
      expect(subject).to eq({
                                'requests' => [ { 'action' => 'addObject', 'body' => { 'name' => 'taro' }},
                                                { 'action' => 'addObject', 'body' => { 'name' => 'tom' }}
                                ]
                            })
    end
  end
end