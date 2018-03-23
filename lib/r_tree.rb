require_relative './r_tree/version.rb'
require_relative './tree.rb'

module RTree
  module_function

  #Get instance of class :Tree
  def get(path, layer)
    return Tree.new(path,layer)
  end


  #tree only indicates directories
  #Arguments path:Root path of the directory  rem: Remaining hierarchy

  #tree with files
  #Arguments path:Root path of the directory  rem: Remaining hierarchy
#  def ftree(path, rem)
#    return tree_rec(path, Array.new(0), rem, true).flatten
#  end


end
