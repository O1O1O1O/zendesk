class Problem

  attr_accessor :parents
  attr_accessor :children

  def initialize
    @parents = []
    @children = []
  end
  
  def ingest(data)
    data.each do |parent, child|
      parents << parent
      children << child
    end
  end

  def roots
    parents - children
  end

  def leaves
    children - parents
  end
end



