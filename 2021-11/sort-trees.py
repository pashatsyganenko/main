l = [(1,2),(3,4),(1,4),(2,4)]

def mmm(t):
	m = 0
	for (a,b) in t:
		m = max(a,b,m)
	return m

def print_tree(t):
	for i in range(mmm(t)):
		s = "___"
		for j in range(len(t)):
			(a,b) = t[j]
			(x,y) = (min(a,b),max(a,b))
			if x < i+1 <= y:
				s += "_|_"
			else:
				s += "___"
		print(s)

def srt(l,t):
	for (x,y) in t:
		(a,b) = (l[x-1],l[y-1])
		if a>b:
			l[x-1]=b
			l[y-1]=a
	return l
'''
n = 10
k = n*(n+1)*3//2

for i in range(n):
	s = "___"*(i*(i+1)//2)
	for j in range(n-i):
		s += "_|_" + ("___"*(i+j+1))
	print(s[0:k])
'''
def vstavka(n):
	h = []
	for i in range(n):
		for j in range(i):
			h +=[ (i-j,i-j+1)]
	return h
	
	

print_tree(vstavka(7))
print(srt([5,7,4,1,6,3,2],vstavka(7)))
