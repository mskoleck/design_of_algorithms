# You are given as input an unsorted array of n distinct numbers,
# where n is a power of 2. Give an algorithm that identifies the
# second-largest number in the array, and that uses at most n+log2(n) - 2
# comparisons.

require 'pp'

$comparisons = 0 # just to know the number of comparisons

# takes more then n + log(n) - 2 comparisons but easier to understand
def second_smallest(a)
  if a.length == 2  # could use a.min method here but want to have comparisons clearly visible
    $comparisons += 1
    if a[0] <= a[1]
      return a[0], a[1]
    else
      return a[1], a[0]
    end

  end

  l1, l2 = second_smallest(a[0...a.length/2])
  r1, r2 = second_smallest(a[a.length/2...a.length])

  m1, m2 = l1, l2
  $comparisons += 1
  if l1 <= r1
    m1 = l1

   $comparisons += 1
    if l2 <= r1
      m2 = l2
    else
      m2 = r1
    end
  else  # r1 < l1
    m1 = r1
    
    $comparisons += 1
    if r2 <= l1
      m2 = r2
    else
      m2 = l1
    end
  end
  return m1, m2
end

a = [3,4,0,1,9,8,7,5]
pp second_smallest(a)
theoretical = (a.length + Math.log2(a.length) - 2).to_i
puts "#{$comparisons} #{theoretical} #{$comparisons == theoretical}"
