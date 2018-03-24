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

  it 'returns correct formatted json' do
    hs=JSON.parse(RTree.get($SAMPLE_PATH,3).to_json)

    #Root directory is 'test_dir'
    expect(hs['name']).to eq 'test_dir'

    #test_dir/3/5/7/test5
    ch=nil
    hs['childs'].each{|ch1|
      if ch1['name']=='3' then
        ch1['childs'].each{|ch2|
          if ch2['name']=='5' then
            ch2['childs'].each{|ch3|
              ch=ch3 if ch3['name']=='7'
            }
          end
        }
      end
    }
    expect(ch['files'][0]).to eq 'test5'

  end


  
end
