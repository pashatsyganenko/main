#Домашнее задание на 18 мая 2020 года
import math
from prettytable import PrettyTable
#Задача 1
def katalan(n):
    if n==0:
        return 1
    else:
        return sum([katalan(i)*katalan(n-i-1) for i in range(n)])

def print_katalan(m=15):
    for i in range(m):
        print(katalan(i))

#print_katalan()

#Задача 2
def print_circle(r):
    for x in range(-r,r+1):
        for y in range(-r,r+1):
            if r-0.5 < math.sqrt(x*x+y*y) < r+0.5:
                print(' * ', end='')
            else:
                print('   ', end='')
        print('\n')

#print_circle(7)

#Задача 3
def print_mult_table(n,m):
    x = PrettyTable()
    x.field_names=[''] + list(range(1,n+1))
    for i in range(1,m+1):
        x.add_row([i]+[i*j for j in range(1,n+1)])
    print(x)

#print_mult_table(7,9)

#Задача 4
def find_understring(s,unds):
    for i in range(len(s)-len(unds)+1):
        if s[i:(i+len(unds))]==unds:
            return i
    return "No matches"

#print(find_understring("gshfvdjgfhght","ght"))

#Задача 5
def qsort(x):
    if len(x) == 1 or len(x) == 0:
        return x
    else:
        i = 0
        for j in range(len(x)-1):
            if x[j+1] < x[0]:
                x[j+1],x[i+1] = x[i+1], x[j+1]
                i += 1
        x[0],x[i] = x[i],x[0]
        return qsort(x[:i]) + [x[i]] + qsort(x[i+1:])

#print(qsort([3,2,1,4,6,5,8,9,7]))

#Задача 6
def heapify(lst, n, i):
    largest = i
    l = 2 * i + 1
    r = 2 * i + 2
    if l < n and lst[i] < lst[l]:
        largest = l
    if r < n and lst[largest] < lst[r]:
        largest = r
    if largest != i:
        lst[i],lst[largest] = lst[largest],lst[i]
        heapify(lst,n,largest)

def heapsort(l):
    for i in range(len(l), -1, -1):
        heapify(l, len(l), i)
    for i in range(len(l)-1, 0, -1):
        l[i], l[0] = l[0], l[i]
        heapify(l, i, 0)
    return l

#print(heapsort([1,3,6,5,4,2,7,9,8]))
