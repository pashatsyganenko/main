    for _ in range(int(input())):
        t = int(input())
        l = []
        o = True
        for _ in range(t):
            l.append(input())
        if t==1:
            o = True
        else:
            for i in range(t-1):
                for j in range(t-1):
                    if l[i][j]=='1' and l[i+1][j]=='0' and l[i][j+1]=='0':
                        o = False
                        break
                        break
        if o:
            print("YES")
        else:
            print("NO")
