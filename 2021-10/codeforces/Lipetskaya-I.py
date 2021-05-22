a,b = input().split()
n = int(a)
k = int(b)
r = 998244353

def power(x,m):
    if m == 0:
        return 1
    elif m == 1:
        return x
    elif m%2 == 1:
        y = power(x,(m-1)//2)
        return (x*y*y)%r
    else:
        y = power(x,m//2)
        return (y*y)%r
      
q = (n-1)//2
if n%2 == 0:
    print((2*power(n//2,k)-1)%r)
else:
    s = 0
    g = 1
    for _ in range(k):
        s += g
        g = (g*q) % r
    p = power(q,k)
    print(((2*p)-1+s)%r)
