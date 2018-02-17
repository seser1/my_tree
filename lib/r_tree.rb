require_relative './r_tree/version.rb'

#layer_list_last 1:line continues 0:line end
LL=['└─ ', '├─ ']
#layer_list_middle 1:line continued 0:line ended
LM=['   ', '│  ']

module RTree
  def tree(path, layer_list, rem)
    layer_list.each_with_index{|l, i|
      print i==layer_list.count-1 ? LL[l] : LM[l]
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
        tree(ne_path, layer_list.dup.push(c==0 ? 0 : 1), rem-1) 
      end
    }
  end

  module_function :tree
end
