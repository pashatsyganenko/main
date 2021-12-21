# http://neerc.ifmo.ru/school/archive/2021-2022/ru-olymp-team-internet-2021-problems-russian.pdf
# Задача E. Хокку

gl = ["a", "e", "i", "o", "u"]
l = []
n = int(input())

for i in range(n):
	s = input()
	w = 0 # Количество слогов
	c = 0
	for x in s:
		if x in gl:
			c=1
		else:
			w += c
			c = 0
	l.append(w+c)

ans = 0

s = 0
b = n-1
while s<17 and b>=0:
	s += l[b]
	b -= 1

for i in range(n):
	if i > b:
		break
	a = l[i]
	(x,y,z) = (0,0,0)
	k = i+1
	while x < 5-a:
		x += l[k]
		k += 1
	if x > 5-a:
		continue
	while y < 7:
		y += l[k]
		k += 1
	if y > 7:
		continue
	while z < 5:
		z += l[k]
		k += 1
	if z == 5:
		ans += 1

print(ans)
