require_relative './r_tree/version.rb'
require_relative './tree.rb'

module RTree
  module_function

  #Get instance of class :Tree
  def get(path, layer)
    Tree.new(path,layer)
  end

end
