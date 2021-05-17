    n = int(input())
    l = input().split()
    g = [0]*100000
    for i in l:
        g[int(i)-1] += 1
    '''
    p = []
    a = []
    for i in range(100000):
        b = g[i]
        if b!=0:
            a.append((i+1)*b)
        else:
            if a != []:
                p.append(a)
                a = []
    def f(v):
        if v==[]:
            return 0
        elif len(v)==1:
            return v[0]
        elif len(v)==2:
            return max(v)
        else:
            return max(v[0]+f(v[2:]),v[1]+f(v[3:]))
    c = 0
    for q in p:
        c += f(q)
    print(c)
    '''
    x,y = 0,0
    for i in range(100000):
        x,y = max((i+1)*g[i]+y,x),x
    print(x)
