k,n = [int(i) for i in input().split()]
l = [int(i) for i in input().split()]

r = 0
m = n

for i in range(k):
	d = m-l[i]
	if d == 0:
		if i != k-1:
			m = n
		else:
			m = 0
		r += 1
	elif d>0:
		m = d

print(r)
print(m)

