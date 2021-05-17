n = int(input())
l = []
for _ in range(n-1):
    x,y = input().split()
    l.append((int(x),int(y)))
 
o = True
p = 0
g = [0 for i in range(n)]
for (a,b) in l:
    if g[a-1]==2:
        o = False
        p = a
        break
    else:
        g[a-1]+=1
    if g[b-1]==2:
        o = False
        p = b
        break
    else:
        g[b-1]+=1
 
q = [i for i in range(n-2,-1,-1)]
if o:
    for i in range(n-1):
        print(i)
else:
    for (a,b) in l:
        if a==p or b==p:
            print(q[-1])
            q.pop()
        else:
            print(q[0])
            q.pop(0)
