require_relative './lib/r_tree.rb'

#Should write exception handling

$SAMPLE_PATH='./spec/test_dir'

if ARGV[0]=~/^[0-9]+$/ then
  #This path is for testing
  path=File.expand_path($SAMPLE_PATH)
  layer=ARGV[0].to_i
else
  if Dir.exist?(ARGV[0]) then
    path=ARGV[0]
    layer=ARGV[1].to_i
  else
    exit(3)
  end
end

RTree.tree(path,layer).each{|s|
  puts s
}
