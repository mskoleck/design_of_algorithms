require 'pp'

def read_file(filename)
  g = {}
  File.open(filename).each_line do |l|
    node = l[0].to_i
    edges = l.split().[1...-1].map {|e| e.to_i}
    g[node] = edges
  end
  return g
end


pp read_file('dfs_graph.txt')
