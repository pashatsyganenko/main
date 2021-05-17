    t = int(input())
     
    g = []
     
    for x in range(t):
        n, m = input().split()
        l = []
        for y in range(int(n)):
            l.append(input())
        p = [[0]*(int(m)+2) for i in range(int(n)+1)]
        for i in range(int(n)-1, -1, -1):
            for j in range(1, int(m)+1):
                if l[i][j-1] == '*':
                    p[i][j] = min(p[i+1][j-1], p[i+1][j], p[i+1][j+1]) + 1
        print(sum([sum(h) for h in p]))
     
     
     
     
    #g = []
     
    #for i in range(t):
    #    n,m = (input()).split()
    #    l = []
    #    for j in range(int(n)):
    #        l.append(input())
    #    c = 0
    #    p = []
    #    for s in l:
    #        d = []
    #        for (a,b) in p:
    #            z = int((b-1)/2)
    #            if s[(a-z):(a+z+1)]=="*"*b:
    #                c += 1
    #                d.append((a,b+2))
    #        q = 0
    #        for k in s:
    #            if k=='*':
    #                c += 1
    #                d.append((q,3))
    #            q += 1
    #        p = d
    #    g.append(c)
     
    #for u in g:
    #    print(u)
