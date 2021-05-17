    t = int(input())
    g = []
    for i in range(t):
        x = int(input())
        p = (input()).split()
        d = 0
        k = x-1
        l = []
        while (k>=0):
            a = int(p[k])
            d = max(d,a)
            if d==0:
                l.append(0)
            else:
                l.append(1)
                d += -1
            k += -1
        l.reverse()
        g.append(l)
    for h in g:
        for s in h:
            print(s, end=' ')
        print()
