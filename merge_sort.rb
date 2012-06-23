require 'pp'

def merge_sort(a)
  len = a.length
  if len == 1
    return a
  end

  sorted_l = merge_sort(a[0...(len / 2)])
  sorted_r = merge_sort(a[(len / 2)...len])
  merged = merge(sorted_l, sorted_r)
  return merged
end

def merge(l, r)
  m = Array.new
  l_i = 0
  r_i = 0
  0.upto(l.length + r.length - 1) do |i|
    if l_i < l.length && r_i < r.length
      if l[l_i] <= r[r_i]
        m[i] = l[l_i]
        l_i += 1
      else
        m[i] = r[r_i]
        r_i += 1
      end
    elsif l_i < l.length
        m[i] = l[l_i]
        l_i += 1
    else
        m[i] = r[r_i]
        r_i += 1
    end
  end
  return m
end

pp merge_sort([5,4,3,2,1,0])
