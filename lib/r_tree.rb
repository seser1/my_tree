require_relative './r_tree/version.rb'

#layer_list_last 1:line continues 0:line end
LL=['└─ ', '├─ ']
#layer_list_middle 1:line continued 0:line ended
LM=['   ', '│  ']

module RTree
  module_function

  #tree only indicates directories
  #Arguments path:Root path of the directory  rem: Remaining hierarchy
  def tree(path, rem)
    return tree_rec(path, Array.new(0), rem, false).flatten
  end

  #tree with files
  #Arguments path:Root path of the directory  rem: Remaining hierarchy
  def ftree(path, rem)
    return tree_rec(path, Array.new(0), rem, true).flatten
  end

  #Explore directories recursively
  #layer_list: Symbols put at the top that indicates directory hierarchy
  def tree_rec(path, layer_list, rem, with_file)
    s,f=[],[]
  
    base=nil.to_s
    (layer_list.size-1).times{|i|
      base+=LM[layer_list[i]]
    }

    bef=layer_list.last!=nil ? LL[layer_list.last] : nil.to_s
    s.push(base+bef+File.basename(path))

    return s if rem==0

    #After ruby2.5 this may be replaced by Dir.children
    Dir.chdir(path)
    c=Dir.glob("*/",File::FNM_DOTMATCH).reject{|x| x =~ /\.\/$/}.count
  
    Dir.foreach(path) {|d|
      next if d=='.' || d=='..'
      ne_path = File.join(path, d)
  
      if File.directory?(ne_path) then
        c-=1
        ll=marshal = Marshal.load(Marshal.dump(layer_list))
        s.push(tree_rec(ne_path, ll.push(c==0 ? 0 : 1), rem-1, with_file))
      elsif !File.directory?(ne_path)
        f.push(d)
      end
    }

    #Add filenames to s 
    if with_file then
      bef=layer_list.last!=nil ? LM[layer_list.last] : nil.to_s
      f.each{|ff|
        s.push(base+bef+ff)
      }
    end

    return s
  end

end
