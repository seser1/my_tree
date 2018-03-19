require_relative './r_tree/version.rb'

#layer_list_last 1:line continues 0:line end
LL=['└─ ', '├─ ']
#layer_list_middle 1:line continued 0:line ended
LM=['   ', '│  ']

module RTree
  module_function

  #Arguments path:Root path of the directory  rem: Remaining hierarchy
  def tree(path, rem)
    return tree_rec(path, Array.new(0), rem).flatten
  end

  #Explore directories recursively
  #layer_list: Symbols put at the top that indicates directory hierarchy
  def tree_rec(path, layer_list, rem)
    s=Array.new(0)
  
    s.push(nil.to_s)
    layer_list.each_with_index{|l, i|
      s[s.size-1]+=((i==layer_list.count-1) ? LL[l] : LM[l])
    }

    s[s.size-1]+=File.basename(path)
  
    return s if rem==0
  
    #After ruby2.5 this may be replaced by Dir.children
    Dir.chdir(path)
    c=Dir.glob("*/",File::FNM_DOTMATCH).reject{|x| x =~ /\.\/$/}.count
  
    Dir.foreach(path) {|d|
      next if d=='.' || d=='..'
      ne_path = File.join(path, d)
  
      if File.directory?(ne_path) then
        c-=1
        s.push(tree_rec(ne_path, layer_list.dup.push(c==0 ? 0 : 1), rem-1))
      end
    }

    return s
  end

end
