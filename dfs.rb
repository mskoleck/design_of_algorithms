require 'pp'

def read_file(filename)
  g = {}
  File.open(filename).each_line do |l|
    ln = l.split().map {|e| e.to_i}
    g[ln[0]] = ln[1..-1]
  end
  return g
end

# iterative version
def dfsi(g, start_node)
  frontier = []
  visited = []
  s = start_node
  frontier.push(s)
  while !frontier.empty?
    n = frontier.pop()
    visited << n
    p "node: #{n}"
    for e in g[n]
      unless (frontier.include?(e) && visited.include?(e))
        frontier.push(e)
      end
    end
  end
end

# recursive version, does not mark nodes directly, uses an auxiliary var
def dfsr(g, s)
  def _dfsr(g, s, v)
    n = s
    puts "node #{n}"
    for e in g[n]
      unless v.include?(v)
        v.push(e)
        _dfsr(g, e, v)
      end
    end
  end
  _dfsr(g, s, [])
end

# reverses graph edges
def reverse(g) 
  gt = {}
  g.each do |k, v|
    v.each do |e|
      if !gt[e]
        gt[e] = [k]
      else
        gt[e] += [k]
      end
    end
  end
  return gt
end

g = read_file('dfs_graph.txt')
gt = reverse(g)
memory_usage = `ps -o rss= -p #{Process.pid}`.to_i / 1000 # in Megabytes
puts "memory_usage #{memory_usage} MB"

dfsr(g, 1)

