# http://neerc.ifmo.ru/school/archive/2021-2022/ru-olymp-team-internet-2021-problems-russian.pdf
# Задача A. Дружелюбные ладьи

n,m,k = [int(i) for i in input().split()]

x = min(n,m)

if k > x:
	print("Impossible")
else:
	print("Possible")
	for i in range(n):
		for j in range(m):
			if i==j:
				print("*", end="")
			else:
				print(".", end="")
		print()
