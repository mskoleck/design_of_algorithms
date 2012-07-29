class Heap:

    def __init__(self, min_or_max):
        self.data = []
        if min_or_max == 'max':
            self.comp_f = self.max
        elif min_or_max == 'min':
            self.comp_f = self.min

    def setup_f(self, comp_f):
        self.comp_f = comp_f

    def __repr__( self ):
        return "%s(%r)" % (self.__class__, self.data)
    

    def left_c(self, n):
        return 2 * n + 1

    def right_c(self, n):
        return 2 * n + 2
    
    def parent(self, n):
        return (n - 1) / 2

    def insert_element(self, e):
        self.data.append(e)
        e_i = len(self.data) - 1
        
        p_i = self.parent(e_i)
        while (p_i >= 0 and self.comp_f(e_i, p_i)):
            self.swap(e_i, p_i)
            e_i = p_i
            p_i = self.parent(e_i)
            
    def extract(self):

        if len(self.data) == 0:
            return None

        self.swap(0, len(self.data) - 1)
        root = self.data.pop()
        i = 0
        hlen = len(self.data)
        while (i < hlen):
            swap_e = i
            l = self.left_c(i)
            r = self.right_c(i)
            if l < hlen and self.comp_f(l, i):
                swap_e = l
            if r < hlen and self.comp_f(r, swap_e):
                swap_e = r

            if (swap_e != i):
                self.swap(swap_e, i)
                i = swap_e
            else:
                break
        return root

    def min(self, e1, e2):
        return self.data[e1] < self.data[e2]

    def max(self, e1, e2):
        return self.data[e1] > self.data[e2]

    def swap(self, e1, e2):
        self.data[e1], self.data[e2] = self.data[e2], self.data[e1]


h = Heap('min')
h.insert_element(7)
h.insert_element(1)
h.insert_element(2)
h.insert_element(10)
h.insert_element(9)
h.insert_element(8)
h.insert_element(2)
h.insert_element(3)
h.insert_element(7)

print h

r = h.extract()
while r != None:
    print r
    print h
    r = h.extract()


print h
