#layer_list: 'br' 'be'
LL={'br'=>'├─ ', 'be'=>'└─ '}

def tree(path, layer_list, rem)
  layer_list.each_with_index{|la, i|
    if i==layer_list.count-1 then
      print LL[la]
    else
      print la=='br' ? '│  ' : '   '
    end
  }
  puts File.basename(path)

  return if rem==0

  #After ruby2.5 this may be replaced by Dir.children
  Dir.chdir(path)
  c=Dir.glob("*/",File::FNM_DOTMATCH).reject{|x| x =~ /\.\/$/}.count

  Dir.foreach(path) {|d|
    next if d=='.' || d=='..'
    ne_path = File.join(path, d)

    if File.directory?(ne_path) then
      c-=1
      tree(ne_path, layer_list.dup.push(c==0 ? 'be' : 'br'), rem-1) 
    end
  }
end
