# Задача A. Эпическая потасовка
# Условие: https://rsr-olymp.ru/upload/files/tasks/465/2017/8643534-tasks-iikt-7-11-final-17-18.pdf

h1, a1 = [int(i) for i in input().split()]
h2, a2 = [int(i) for i in input().split()]

t = (h1+a2-1)/a2 >= (h2+a1-1)/a1

if t:
    print('Bandergolf Cyberswitch')
else:
    print('Benadryl Cabbagepatch')
