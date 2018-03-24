require_relative './lib/r_tree.rb'

#Should write exception handling

$SAMPLE_PATH='./test_dir'

if Dir.exist?(ARGV[0]) then
  path=ARGV.shift
end

if ARGV[0]=~/^[0-9]+$/ then
  layer=ARGV.shift.to_i
else
  puts 'Illegal argument'
  exit(3)
end
  
#This path is for testing
path=File.expand_path($SAMPLE_PATH) if path==nil


tree=RTree.get(path,layer)
puts JSON.generate(tree)
