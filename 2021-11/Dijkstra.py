# Задача A

n,s,f = [int(i) for i in input().split()]

l = []
inf = 999999999999999999
d = {}
u = {}
for i in range(n):
	l.append([int(j) for j in input().split()])
	d[i] = inf
	u[i] = False
	
d[s-1] = 0


for i in range(n):	
	m = 0
	for x in range(n):
		if (not u[x]) and (m == 0 or d[x] < d[i]):
			m = x
	if d[m] == inf:
		break
	u[m] = True
	g = []
	for y in range(n):
		t = l[m][y]
		if t > 0:
			g.append((y,t))
	for (z,k) in g:
		d[z] = min(d[z],d[m]+k)


ans = d[f-1]
if ans == inf:
	print(-1)
else:
	print(ans)




# Задача B
n,s,f = [int(i) for i in input().split()]

l = []
inf = 999999999999999999
d = {}
u = {}
p = [-1 for i in range(n)]
for i in range(n):
	l.append([int(j) for j in input().split()])
	d[i] = inf
	u[i] = False
	
d[s-1] = 0


for i in range(n):	
	m = 0
	for x in range(n):
		if (not u[x]) and (m == 0 or d[x] < d[i]):
			m = x
	if d[m] == inf:
		break
	u[m] = True
	g = []
	for y in range(n):
		t = l[m][y]
		if t > 0:
			g.append((y,t))
	for (z,k) in g:
		if d[m] + k < d[z]:
			d[z] = d[m] + k
			p[z] = m


ans = d[f-1]
if ans == inf:
	print(-1)
else:
	h = []
	q = f-1
	while q != s-1:
		h.append(q)
		q = p[q]
	h.append(s-1)
	while h != []:
		print(h.pop(-1) + 1, end = " ")
	print()




# Задача C

n = int(input())
cost = [int(t) for t in input().split()]
mq = int(input())
l = []
inf = 999999999999999999

for i in range(mq):
	a,b = input().split()
	l.append((int(a)-1,int(b)-1))

d = {}
u = {}


for i in range(n):
	d[i] = inf
	u[i] = False

d[0] = 0

for i in range(n):
	print(1)
	m = None
	for x in range(n):
		if (not u[x]) and (m == None or d[x] < d[m]):
			m = x
	if d[m] == inf:
		break
	u[m] = True
	g = []
	for y in range(mq):
		(a,b) = l[y]
		if a == m:
			g.append(b)
		elif b == m:
			g.append(a)
	print(g)
	for z in g:
		d[z] = min(d[z],d[m]+cost[z])

ans = d[n-1]
if ans == inf:
	print(-1)
else:
	print(ans+cost[0]-cost[-1])
