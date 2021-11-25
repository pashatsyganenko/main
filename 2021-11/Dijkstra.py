# Задача A

n,s,f = [int(i) for i in input().split()]

l = []
inf = 999999999999999999

for i in range(n):
	l.append([int(j) for j in input().split()])

d = {}
for i in range(n):
	d[i] = inf
d[s-1] = 0
u = {}

for i in range(n):
	u[i] = False

for i in range(n):	
	m = 0
	for x in range(n):
		if (not u[x]) and (m == 0 or d[x] < d[i]):
			m = x
		if d[i] == inf:
			break
		u[i] = True
		g = []
		for y in range(n):
			t = l[i][y]
			if t > 0:
				g.append((y,t))
		for (z,k) in g:
			d[z] = min(d[z],d[i]+k)

ans = d[f-1]
if ans == inf:
	print(-1)
else:
	print(d[f-1])




# Задача B	

n,s,f = [int(i) for i in input().split()]

l = []
inf = 999999999999999999

for i in range(n):
	l.append([int(j) for j in input().split()])

d = {}
u = {}
p = [-1 for i in range(n)]

for i in range(n):
	d[i] = inf
d[s-1] = 0


for i in range(n):
	u[i] = False

for i in range(n):	
	m = 0
	for x in range(n):
		if (not u[x]) and (m == 0 or d[x] < d[i]):
			m = x
		if d[i] == inf:
			break
		u[i] = True
		g = []
		for y in range(n):
			t = l[i][y]
			if t > 0:
				g.append((y,t))
		for (z,k) in g:
			d[z] = min(d[z],d[i]+k)
			p[z] = i

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
