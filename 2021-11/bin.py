# 1 Квадратный корень

k = 564

def f(n,m):
	if abs(n-m) <= 1:
		return n
	else:
		if ((n+m)//2)**2 > k:
			return f(n,(n+m)//2)
		else:
			return f((n+m)//2,m)

# print(f(0,k))

# 2 Корень функции

def find_root(a,b,f,y):
	if b-a <= 1:
		return (a if f(a) == y else None)
	m = (a+b)//2
	k = f(m)
	if k == y:
		return m
	elif k > y:
		return find_root(a,m,f,y)
	else:
		return find_root(m,b,f,y)

def f(i):
	return int(i**2)

# print(find_root(0,100,f,49))
