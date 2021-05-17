    d = {'polycarp':1}
    for _ in range(int(input())):
        x,y = input().lower().split(' reposted ')
        d[x] = d[y] + 1
    print(max(d.values()))
