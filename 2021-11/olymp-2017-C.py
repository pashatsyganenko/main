# Задача C. Индийская клавиатура
# Условие: https://rsr-olymp.ru/upload/files/tasks/465/2017/8643534-tasks-iikt-7-11-final-17-18.pdf

n,m,p,q = [int(i) for i in input().split()]
kl = []
for i in range(n):
    kl.append([int(i) for i in input().split()])
s = int(input())
a = [int(i) for i in input().split()]

def find(c):
    for i in range(n):
        for j in range(m):
            if kl[i][j] == c:
                return (i,j)

def f(x,min1=n+1,max1=-1,min2=m+1,max2=-1):
    if x==[]:
        return 0
    else:
        w = x[0]
        e = x.pop(0)
        (i,j) = find(w)
        if i>max1:
            max1 = i
        elif i<min1:
            min1=i
        if j>max2:
            max2 = j
        elif j<min2:
            min2=j
        if max1-min1 >= p or max2-min2 >= q:
            return 1 + f([e] + x,n+1,-1,m+1,-1)
        else:
            return f(x,min1,max1,min2,max2)

print(f(a))
