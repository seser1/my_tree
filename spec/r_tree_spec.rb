$SAMPLE_PATH=File.expand_path('./spec/test_dir')

RSpec.describe RTree do
  it "has a version number" do
    expect(RTree::VERSION).not_to be nil
  end

  it 'returns array which has correct number of lines' do
    expect(RTree.tree($SAMPLE_PATH,1).size).to eq 4
    expect(RTree.tree($SAMPLE_PATH,2).size).to eq 6
    expect(RTree.tree($SAMPLE_PATH,3).size).to eq 8
  end
end
