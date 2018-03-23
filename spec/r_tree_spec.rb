$SAMPLE_PATH=File.expand_path('./test_dir')

RSpec.describe RTree do
  it "has a version number" do
    expect(RTree::VERSION).not_to be nil
  end

  it 'returns array which has correct number of lines' do
    expect(RTree.get($SAMPLE_PATH,1).to_s.size).to eq 4
    expect(RTree.get($SAMPLE_PATH,2).to_s.size).to eq 6
    expect(RTree.get($SAMPLE_PATH,3).to_s.size).to eq 8
  end

  #Because .rspec_status will generated in test directry, this test will fail from 2nd exection.
  #It must be corrected.
  it 'returns array which has correct number of lines (output with files)' do
    expect(RTree.get($SAMPLE_PATH,1).to_s(:f).size).to eq 6
    expect(RTree.get($SAMPLE_PATH,2).to_s(:f).size).to eq 9
    expect(RTree.get($SAMPLE_PATH,3).to_s(:f).size).to eq 13
  end
end
