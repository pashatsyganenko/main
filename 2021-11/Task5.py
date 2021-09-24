# Условие: https://rsr-olymp.ru/upload/files/tasks/465/2017/8643534-tasks-iikt-10-11-otbor-17-18.pdf
# Задача 5 (В1)

n = int(input())
l = []

for i in range(n):
    a,b = input().split()
    l.append((int(a),int(b)))

def f(x,y,z):
    (x1,y1) = x
    (x2,y2) = y
    (x3,y3) = z
    if x1 == x2:
        if x3 > x1:
            return 1
        elif x3 < x1:
            return 0
        else:
            return -1
    else:
        #k = (y1-y2)/(x1-x2)
        #b = y1 - (k*x1)
        #p = (k*x3) + b
        p = ((y1-y2)*(x3-x1))/(x1-x2) + y1
        if y3 < p:
            return 1
        elif y3 > p:
            return 0
        else:
            return -1

if n <= 2:
    print(0)
else:
    w = 1
    t = f(l[0],l[1],l[2])
    for i in range(n+1):
        g = f(l[i%n],l[(i+1)%n],l[(i+2)%n])
        if g == 0:
            w = -1
            break
        if g != t:
            w = 0
    print(w)
