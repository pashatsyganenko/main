    n = int(input())
    l = []
    b = []
    d = {}
    for i in range(n):
        s = input()
        l.append(s)
        for j in s:
            if j not in b:
                b.append(j)
    for i in b:
        d[i]=False
    for s in l:
        for h in range(len(s)-1):
            if s[h]==s[h+1]:
                d[s[h]] = True
     
    def create(ch,r,m):
        if r == m:
            return []
        else:
            return [(ch,r)] + create(ch,r+1,m)
    c = []
    o = 1
    for i in b:
        t = d[i]
        if d[i]:
            c += [(i,o),(i,o+1)]
            o += 2
        else:
            c += [(i,o)]
            o += 1
    print(len(c))
    for s in l:
        e = c.copy()
        k = 0
        m = len(s)-1
        for q in s:
            for (g,r) in e:
                if g==q:
                    if k != m:
                        print(r, end=' ')
                        e = c.copy()
                        e.remove((g,r))
                        k += 1
                    else:
                        print(r)
                    break
