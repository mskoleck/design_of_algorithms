def merge_sort(a):
    if len(a) == 1:
        return a

    sorted_l = merge_sort(a[:len(a)/2])
    sorted_r = merge_sort(a[len(a)/2:])
    merged = merge(sorted_l,sorted_r)
    return merged

def merge(l, r):
    m = []
    l_i = 0
    r_i = 0

    for i in range(len(l) + len(r)):
        if l_i < len(l) and r_i < len(r):
            if l[l_i] <= r[r_i]:
                m.append(l[l_i])
                l_i += 1
            else:
                m.append(r[r_i])
                r_i += 1
        elif l_i < len(l):
            m.append(l[l_i])
            l_i += 1
        else:
            m.append(r[r_i])
            r_i += 1
    return m

print merge_sort([5,4,3,2,1,0])            
