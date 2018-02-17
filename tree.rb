
def tree(path, layer_cur, layer_rem)
  layer_cur.times{print'  '}
  puts File.basename(path)
  return if layer_rem==0

  Dir.foreach(path) {|d|
    next if d=='.' || d=='..'
    ne_path = File.join(path, d)
    tree(ne_path, layer_cur+1, layer_rem-1) if File.directory?(ne_path)
  }
end