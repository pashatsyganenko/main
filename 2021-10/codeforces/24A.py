    n = int(input())
    l = []
    for _ in range(n):
        a,b,c = input().split()
        l.append((int(a),int(b),int(c)))
    (a,b,c) = l[0]
    l.pop(0)
    def f(b,x,y):
        if l!=[]:
            for (p,q,t) in l:
                if p==b:
                    l.remove((p,q,t))
                    return f(q,x+t,y)
                if q==b:
                    l.remove((p,q,t))
                    return f(p,x,y+t)
        else:
            return min(x,y)
    print(f(b,c,0))
