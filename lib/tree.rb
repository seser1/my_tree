#layer_list_last 1:line continues 0:line end
$LL=['└─ ', '├─ ']
#layer_list_middle 1:line continued 0:line ended
$LM=['   ', '│  ']

#Class for storing directory structure
class MDir
  attr_accessor :name, :childs, :files, :depth

  def initialize(name)
    @name=name
    @childs,@files=[],[]
  end
end


class Tree
  #Initialization
  #Arguments path:Root path of the directory  rem: Remaining hierarchy
  def initialize(path, rem)
    @root=MDir.new(File.basename(path))
    get(path, rem, @root)
  end

  #Explore directories recursively and store directory data using adjacency list
  def get(path, rem, slf)  
    Dir.foreach(path) {|d|
      next if d=='.' || d=='..'
      ne_path = File.join(path, d)
  
      if rem>0 && File.directory?(ne_path) then
        child=MDir.new(d)
        slf.childs.push(child)
        get(ne_path, rem-1, child)
      elsif !File.directory?(ne_path)
        slf.files.to_a.push(d)
      end
    }
  end

  #Return array of string
  def to_s(file=nil)
    return s_rec(Array.new(0), @root, file).flatten
  end

  #Recursively generate array of string
  #layer_list: Symbols put at the top that indicates directory hierarchy
  def s_rec(layer_list, cur, file)
    s=[]
  
    base=nil.to_s
    (layer_list.size-1).times{|i|
      base+=$LM[layer_list[i]]
    }

    bef=layer_list.last!=nil ? $LL[layer_list.last] : nil.to_s
    s.push(base+bef+cur.name)

    cur.childs.each_with_index {|d, i|
      ll=Marshal.load(Marshal.dump(layer_list))
      s.push(s_rec(ll.push(i==cur.childs.size-1 ? 0 : 1), d, file))
    }

    #Add filenames to s
    if file==:f then
      bef=layer_list.last!=nil ? $LM[layer_list.last] : nil.to_s
      cur.files.each{|f|
        s.push(base+bef+f)
      }
    end

    return s
  end

end