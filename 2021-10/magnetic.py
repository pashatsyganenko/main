from math import *
from turtle import *

speed(0)
hideturtle()
q = [(0.0,100.0,1.5),(0.0,-100.0,-15)]

e = 1

k = [(cos(i*pi/15),sin(i*pi/15)) for i in range(30)]

d = []
for (x,y,p) in q:
    if p>0:
        for (a,b) in k:
            d.append((x+a,y+b,e))
        #d.append((x+1,y,e))
        #d.append((x-1,y,e))
        #d.append((x,y+1,e))
        #d.append((x,y-1,e))
        #d.append((x+1,y+1,e))
        #d.append((x+1,y-1,e))
        #d.append((x-1,y+1,e))
        #d.append((x-1,y-1,e))

def normal(x,y):
    r = sqrt(x**2+y**2)
    return (x/r,y/r)

for (x,y,p) in d:
    (n,m) = (x,y)
    pendown()
    flag = True
    for i in range(1000):
        if not flag:
            break
        else:
            (f1,f2) = (0,0)
            for (a,b,w) in q:
                r = sqrt((a-n)**2+(b-m)**2)
                if r<1 and w<0:
                    flag = False
                    break
                else:
                    (c,d) = normal(n-a,m-b)
                    t = p*w/((a-n)**2+(b-m)**2)
                    (f1,f2) = (f1+(c*t),f2+(d*t))
            (f1,f2) = normal(f1,f2)
            if f1**2+f2**2<1:
                goto(n,m)
            (n,m) = (n+f1,m+f2)
            #print(n,m)
    penup()


exitonclick()
