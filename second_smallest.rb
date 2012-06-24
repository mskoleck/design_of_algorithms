# You are given as input an unsorted array of n distinct numbers,
# where n is a power of 2. Give an algorithm that identifies the
# second-largest number in the array, and that uses at most n+log2(n) - 2
# comparisons.

require 'pp'

$comparisons = 0 # just to know the number of comparisons

def second_smallest(a)
  smallest, losers = _second_smallest(a)
  second = losers[0]
  if losers.length > 1
    losers[1...losers.length].each do |e| 
      $comparisons +=1
      smallest = e if e < smallest
    end
  end
  return smallest, second
end


def _second_smallest(a)
  if a.length == 2  # could use a.min method here but want to have comparisons clearly visible
    $comparisons += 1
    if a[0] <= a[1]
      return a[0], [a[1]]
    else
      return a[1], [a[0]]
    end
  end

  l, la = _second_smallest(a[0...a.length/2])
  r, ra = _second_smallest(a[a.length/2...a.length])

  smallest = -1, losers = []
  $comparisons += 1
  if l <= r
    smallest = l
    losers = la
    losers << r
  else
    smallest = r
    losers = ra
    losers << l
  end
  return smallest, losers
end


a = [3,4,0,1,9,8,7,5]
pp second_smallest(a)
theoretical = (a.length + Math.log2(a.length) - 2).to_i
puts "#{$comparisons == theoretical}"
